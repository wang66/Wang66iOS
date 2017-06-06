//
//  HttpConnect.m
//  HttpManagerDemo
//
//  Created by 王亚文 on 2017/5/7.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "HttpConnect.h"
//#import "UserInfoModel.h"
#import "URLPath.h"

#define TimeOut 10.f
#define MaxRequestCount 2


@interface HttpConnect ()

@property (nonatomic, strong)NSMutableURLRequest       *request;
@property (nonatomic, strong)NSURLConnection           *connection;
@property (nonatomic, strong)NSHTTPURLResponse         *httpResponse;
@property (nonatomic, assign)BOOL                       isConnected;
@property (nonatomic, assign)BOOL                       isTimerOut;
@property (nonatomic, strong)NSTimer                   *connectTimer;

@property (nonatomic, assign)NSInteger                  dataSize;
@property (nonatomic, strong)NSMutableData             *jsonData;
@property (nonatomic, strong)id                         resultData;


@property (nonatomic, assign)NSInteger                  requestCount;

@end

@implementation HttpConnect

- (HttpConnect *)initWithHttpMethod:(HttpRequestMethod)method
                                url:(NSString *)url
                         parameters:(NSDictionary *)parameters
                    connectDelegate:(id<HttpConnectDelegate>)delegate
{
    self = [super init];
    if(self)
    {
        _requestURL = url;
        _parameters = parameters;
        _connectDelegate = delegate;
        _isConnected = NO;
        _isTimerOut = NO;
        _dataSize = 0;
        _jsonData = [NSMutableData data];
        
        _requestURL = [NSString stringWithFormat:@"%@%@", BasicURL, url];
        
        // get
        if(method == GET)
        {
            
            NSString * paramUrl = [self urlStrFromParameters:parameters];
            if(paramUrl.length>0){
                _requestURL = [NSString stringWithFormat:@"%@?%@",_requestURL,paramUrl];
            }
            _request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:_requestURL]];
            _request.HTTPMethod = @"GET";
        }
        // post
        else if(method == POST)
        {
            NSString * paramUrl = [self urlStrFromParameters:parameters];
            _request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:_requestURL]];
            if(paramUrl.length>0){
                _request.HTTPBody = [paramUrl dataUsingEncoding:NSUTF8StringEncoding];
            }
            _request.HTTPMethod = @"POST";
        }
        
        [_request setValue:@"" forHTTPHeaderField:@"x-auth-token"];
        [_request setValue:nil forHTTPHeaderField:@"UA"];
        [_request setValue:nil forHTTPHeaderField:@"IMEI"];
        [_request setValue:Nil forHTTPHeaderField:@"_c"];
        
        _connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
    }
    
    return self;
}

- (void)startConnect
{
    if(_isConnected) return;
    _isConnected = YES;
    
    if(_connection){
        [_connection start];
        _connectTimer = [NSTimer scheduledTimerWithTimeInterval:TimeOut target:self selector:@selector(requestTimeOut) userInfo:nil repeats:NO];
        _isTimerOut = NO;
    }
}

- (void)cancel
{
    [super cancel];
    
    if(!_isTimerOut){
        _isTimerOut = YES;
    }
    if(_connection){
        [_connection cancel];
    }
    _connectDelegate = nil;
}

- (void)requestTimeOut
{
    _isTimerOut = YES;
    [self cancel];
    // 请求超时，将失败结果回调
    if(_connectDelegate&&[_connectDelegate respondsToSelector:@selector(httpConnect:didFailWithError:)]){
        [_connectDelegate httpConnect:self didFailWithError:nil];
    }
}

// 将参数数据拼接成字符串
- (NSString *)urlStrFromParameters:(NSDictionary *)parameters
{
    if(!parameters||parameters.count==0){
        return nil;
    }
    
    NSMutableString *mStr = [NSMutableString stringWithString:@""];

    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [mStr appendFormat:@"%@=%@&",(NSString *)key, (NSString *)obj];
    }];
    if(mStr.length>0){
        mStr = [mStr substringToIndex:mStr.length-1].mutableCopy;
    }

    return mStr.copy;
}




#pragma mark - conncection delegate

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // 再请求一次
    if(_requestCount<MaxRequestCount){
        _requestCount++;
        if(_connection){
            [_connection cancel];
            _connection = nil;
        }
        _connection = [[NSURLConnection alloc] initWithRequest:_request delegate:self];
        [_connection start];
        return;
    }
    
    // 将失败结果回调
    if(_connectDelegate&&[_connectDelegate respondsToSelector:@selector(httpConnect:didFailWithError:)]){
        [_connectDelegate httpConnect:self didFailWithError:error];
    }
    
    [self cancel];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _httpResponse = (NSHTTPURLResponse *)response;
    if(_httpResponse&&[_httpResponse respondsToSelector:@selector(allHeaderFields)]){
        NSDictionary *headerFields = [_httpResponse allHeaderFields];
//        _dataSize = [[headerFields objectForKey:@"Content-Length"] integerValue];
        
        NSString *token = headerFields[@"x-auth-token"];
//        [UserInfoModel saveToken:token];
        
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_jsonData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if(!_isTimerOut){
        _isTimerOut = YES;
        [_connectTimer invalidate];
    }
    
//    if(_httpResponse.statusCode!=200){
//        if([_connectDelegate respondsToSelector:@selector(httpConnect:didResponseWithStatusCode:)]){
//            [_connectDelegate httpConnect:self didResponseWithStatusCode:_httpResponse.statusCode];
//        }
//        return;
//    }
    
    
    id resultdData = [NSJSONSerialization JSONObjectWithData:_jsonData options:NSJSONReadingMutableLeaves error:nil];
    if([resultdData isKindOfClass:[NSDictionary class]]){
        _resultData = (NSDictionary *)resultdData;
    }else if([resultdData isKindOfClass:[NSArray class]]){
        _resultData = (NSArray *)resultdData;
    }
    
    if(_connectDelegate&&[_connectDelegate respondsToSelector:@selector(httpConnect:didFinshWithJSONDict:)]){
        [_connectDelegate httpConnect:self didFinshWithJSONDict:_resultData];
    }

}







- (BOOL)connection:(NSURLConnection *)connection canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    return [protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
//    if(OPEN_TEST<=3)
//    {
//        //直接验证服务器是否被认证（serverTrust），这种方式直接忽略证书验证，直接建立连接，但不能过滤其它URL连接，可以理解为一种折衷的处理方式，实际上并不安全，因此不推荐。
//        SecTrustRef serverTrust = [[challenge protectionSpace] serverTrust];
//        return [[challenge sender] useCredential: [NSURLCredential credentialForTrust: serverTrust]
//                      forAuthenticationChallenge: challenge];
//    }

    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){
        
        [[challenge sender]  useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
        
        [[challenge sender]  continueWithoutCredentialForAuthenticationChallenge: challenge];
        
    }
}

@end

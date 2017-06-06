//
//  HttpManager.m
//  HttpManagerDemo
//
//  Created by 王亚文 on 2017/5/7.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import "HttpManager.h"
#import "HttpConnect.h"

#define NilHandle(x) (x!=[NSNull null] && x!=nil) ? x : nil


@implementation ResponseResult

@end




@interface HttpManager ()<HttpConnectDelegate>

@property (nonatomic, strong)HttpConnect        *httpConnect;

@property (nonatomic, strong)NSOperationQueue   *operationQueue;

@property (nonatomic, copy)ResponseBlock         responseBlock;

@end

@implementation HttpManager


static HttpManager *httpManager = nil;

+ (instancetype)shareManager
{
    if(httpManager==nil){
        httpManager = [[HttpManager alloc] init];
    }
    
    return httpManager;
}

- (instancetype)init
{
    self = [super init];
    if(self){
        _operationQueue = [[NSOperationQueue alloc] init];
        _operationQueue.suspended = YES;
    }
    
    return self;
}

- (void)getWithURL:(NSString *)url
        parameters:(NSDictionary *)parameters
     responseBlock:(ResponseBlock)responseBlock
{
    _responseBlock = responseBlock;
    [self sendHttpRequestWithMethod:GET url:url parameters:parameters showHUD:YES delegate:nil];
}

- (void)getWithURL:(NSString *)url
        parameters:(NSDictionary *)parameters
           showHUD:(BOOL)isShow
     responseBlock:(ResponseBlock)responseBlock
{
    _responseBlock = responseBlock;
    [self sendHttpRequestWithMethod:GET url:url parameters:parameters showHUD:isShow delegate:nil];
}

- (void)getWithURL:(NSString *)url
        parameters:(NSDictionary *)parameters
          delegate:(id<HttpManagerDelegate>)delegate
{
    [self sendHttpRequestWithMethod:GET url:url parameters:parameters showHUD:YES delegate:delegate];
}

- (void)getWithURL:(NSString *)url
        parameters:(NSDictionary *)parameters
           showHUD:(BOOL)isShow
          delegate:(id<HttpManagerDelegate>)delegate
{
    [self sendHttpRequestWithMethod:GET url:url parameters:parameters showHUD:isShow delegate:delegate];
}





- (void)postWithURL:(NSString *)url
         parameters:(NSDictionary *)parameters
      responseBlock:(ResponseBlock)responseBlock
{
    _responseBlock = responseBlock;
    [self sendHttpRequestWithMethod:POST url:url parameters:parameters showHUD:YES delegate:nil];
}

- (void)postWithURL:(NSString *)url
         parameters:(NSDictionary *)parameters
            showHUD:(BOOL)isShow
      responseBlock:(ResponseBlock)responseBlock
{
    _responseBlock = responseBlock;
    [self sendHttpRequestWithMethod:POST url:url parameters:parameters showHUD:isShow delegate:nil];
}

- (void)postWithURL:(NSString *)url
         parameters:(NSDictionary *)parameters
           delegate:(id<HttpManagerDelegate>)delegate
{
    [self sendHttpRequestWithMethod:POST url:url parameters:parameters showHUD:YES delegate:delegate];
}

- (void)postWithURL:(NSString *)url
         parameters:(NSDictionary *)parameters
            showHUD:(BOOL)isShow
           delegate:(id<HttpManagerDelegate>)delegate
{
    [self sendHttpRequestWithMethod:POST url:url parameters:parameters showHUD:isShow delegate:delegate];
}


- (void)sendHttpRequestWithMethod:(HttpRequestMethod)method
                              url:(NSString *)url
                       parameters:(NSDictionary *)parameters
                          showHUD:(BOOL)isShow
                         delegate:(id<HttpManagerDelegate>)delegate
{
    if(isShow){
        [YWAlertTool showLoadingHUD];
    }
    
    [self clearRequestOfUrl:url];
    self.httpManagerDelegate = delegate;
    _httpConnect = [[HttpConnect alloc] initWithHttpMethod:method url:url parameters:parameters connectDelegate:self];
    
    [_httpConnect startConnect];
    
    [_operationQueue addOperation:_httpConnect];
}


- (void)clearAllRequest
{
    [_operationQueue cancelAllOperations];
}

- (void)clearRequestOfUrl:(NSString *)url
{
    for(HttpConnect *httpConnect in _operationQueue.operations)
    {
        if([httpConnect.requestURL isEqualToString:url]){
            [httpConnect cancel];
        }
    }
    
}


#pragma mark - httpConnect delegate

- (void)httpConnect:(HttpConnect *)httpConncet didFinshWithJSONDict:(id)resultData
{
    ResponseResult *result = [ResponseResult new];
//    NSDictionary *head = NilHandle(jsonDict[@"head"]);
//
//    result.status = [NilHandle(head[@"code"]) integerValue];
//    result.message = NilHandle(head[@"msg"]);
    
    result.resultInfo = resultData;
    
    if(_httpManagerDelegate&&[_httpManagerDelegate respondsToSelector:@selector(httpManager:requestResult:)]){
        [_httpManagerDelegate httpManager:httpConncet.requestURL requestResult:result];
    }
    
    [YWAlertTool hideLoadingHUD];
    if(_responseBlock){
        _responseBlock(result);
    }
}

- (void)httpConnect:(HttpConnect *)httpConncet didFailWithError:(NSError *)error
{
    ResponseResult *result = [ResponseResult new];
    result.status = -10;
    result.message = @"网络不给力";
    if(_httpManagerDelegate&&[_httpManagerDelegate respondsToSelector:@selector(httpManager:requestResult:)]){
        [_httpManagerDelegate httpManager:httpConncet.requestURL requestResult:result];
    }
    
    [YWAlertTool hideLoadingHUD];
    if(_responseBlock){
        _responseBlock(result);
    }
}

- (void)httpConnect:(HttpConnect *)httpConncet didResponseWithStatusCode:(NSInteger)statusCode
{
    ResponseResult *result = [ResponseResult new];
    result.status = -10;
    result.message = @"网络不给力";
    if(_httpManagerDelegate&&[_httpManagerDelegate respondsToSelector:@selector(httpManager:requestResult:)]){
        [_httpManagerDelegate httpManager:httpConncet.requestURL requestResult:result];
    }
    
    if(_responseBlock){
        _responseBlock(result);
    }
}


@end

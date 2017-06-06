//
//  HttpConnect.h
//  HttpManagerDemo
//
//  Created by 王亚文 on 2017/5/7.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    GET = 0,
    POST,
} HttpRequestMethod;

@class HttpConnect;
@protocol HttpConnectDelegate <NSObject>

- (void)httpConnect:(HttpConnect *)httpConncet didFailWithError:(NSError *)error;

- (void)httpConnect:(HttpConnect *)httpConncet didFinshWithJSONDict:(id)resultData;

- (void)httpConnect:(HttpConnect *)httpConncet didResponseWithStatusCode:(NSInteger)statusCode;

@end

@interface HttpConnect : NSOperation

@property (nonatomic, copy)NSString                 *requestURL;
@property (nonatomic, strong)NSDictionary           *parameters;
@property (nonatomic, weak)id<HttpConnectDelegate>   connectDelegate;

- (HttpConnect *)initWithHttpMethod:(HttpRequestMethod)method
                                url:(NSString *)url
                  parameters:(NSDictionary *)parameters
             connectDelegate:(id<HttpConnectDelegate>)delegate;

- (void)startConnect;

@end

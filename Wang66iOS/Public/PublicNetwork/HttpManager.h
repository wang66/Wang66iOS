//
//  HttpManager.h
//  HttpManagerDemo
//
//  Created by 王亚文 on 2017/5/7.
//  Copyright © 2017年 wyw. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ResponseResult : NSObject

@property (nonatomic, assign)NSInteger      status;
@property (nonatomic, copy)NSString         *message;
@property (nonatomic, strong)NSDictionary   *dataTotal;
@property (nonatomic, strong)id              resultInfo;

@end








@protocol HttpManagerDelegate <NSObject>

- (void)httpManager:(NSString *)url requestResult:(ResponseResult *)result;

@end




typedef void(^ResponseBlock)(ResponseResult *result);



@interface HttpManager : NSObject

@property (nonatomic, weak)id<HttpManagerDelegate>      httpManagerDelegate;

+ (instancetype)shareManager;


/*
 * get
 */
- (void)getWithURL:(NSString *)url
        parameters:(NSDictionary *)parameters
     responseBlock:(ResponseBlock)responseBlock;

- (void)getWithURL:(NSString *)url
        parameters:(NSDictionary *)parameters
           showHUD:(BOOL)isShow
     responseBlock:(ResponseBlock)responseBlock;

- (void)getWithURL:(NSString *)url
        parameters:(NSDictionary *)parameters
          delegate:(id<HttpManagerDelegate>)delegate;

- (void)getWithURL:(NSString *)url
        parameters:(NSDictionary *)parameters
           showHUD:(BOOL)isShow
          delegate:(id<HttpManagerDelegate>)delegate;




/*
 * post
 */
- (void)postWithURL:(NSString *)url
         parameters:(NSDictionary *)parameters
      responseBlock:(ResponseBlock)responseBlock;

- (void)postWithURL:(NSString *)url
         parameters:(NSDictionary *)parameters
            showHUD:(BOOL)isShow
      responseBlock:(ResponseBlock)responseBlock;

- (void)postWithURL:(NSString *)url
         parameters:(NSDictionary *)parameters
           delegate:(id<HttpManagerDelegate>)delegate;

- (void)postWithURL:(NSString *)url
         parameters:(NSDictionary *)parameters
            showHUD:(BOOL)isShow
           delegate:(id<HttpManagerDelegate>)delegate;


- (void)clearAllRequest;




@end

//
//  LXNetWorking.h
//  LXNetWorking
//
//  Created by John LXThyme on 16/5/10.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AFNetworking/AFNetworking.h>
#import "UIKit+AFNetworking.h"
@class LXNetWorking;

@protocol LXNetworkingManagerDelegate <NSObject>


@optional
- (void)cleanData;
- (NSDictionary *)reformParams:(NSDictionary *)params;
- (BOOL)shouldCache;
- (void)managerCallAPIDidSuccess:(LXNetWorking *)manager;
- (void)managerCallAPIDidFailed:(LXNetWorking *)manager;

@end
@protocol LXDataSourcesManager <NSObject>
//@required
@optional
- (NSString *)baseUrl;
- (NSDictionary *)commonParams;

@end
@protocol LXParamValidatorManager <NSObject>

@optional
- (BOOL)manager:(LXNetWorking *)manager isCorrectWithParamsData:(NSDictionary *)data;
- (BOOL)manager:(LXNetWorking *)manager isCorrectWithCallBackData:(NSDictionary *)data;

@end
@protocol LXCallBackInterceptorManager <NSObject>

@optional
- (void)manager:(LXNetWorking *)manager beforePerformSuccessWithSession:(AFHTTPSessionManager *)sessionManager;
- (void)manager:(LXNetWorking *)manager afterPerformSuccessWithResponse:(AFHTTPSessionManager *)sessionManager;
- (void)manager:(LXNetWorking *)manager beforePerformFailWithResponse:(AFHTTPSessionManager *)sessionManager;
- (void)manager:(LXNetWorking *)manager afterPerformFailWithResponse:(AFHTTPSessionManager *)sessionManager;
- (BOOL)manager:(LXNetWorking *)manager shouldCallAPIWithParams:(NSDictionary *)params;
- (void)manager:(LXNetWorking *)manager afterCallingAPIWithParams:(NSDictionary *)params;

@end

typedef void (^LXSuccessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void (^LXFailureBlock)(NSURLSessionDataTask *task, NSError *error);
typedef void (^LXProgressBlock)(NSProgress * downloadProgress);


typedef void(^LXBaseURLString)(NSString *baseURLString);
typedef NSDictionary *(^LXCommonParams)(NSDictionary *params);
typedef NSDictionary *(^LXReformParams)(NSDictionary *parmas);

typedef BOOL(^LXIsCorrectWithParams)(NSDictionary *params);
typedef BOOL(^LXIsCorrectWithResponseData)(NSDictionary *params);

typedef void(^LXBeforeSuccess)(NSURLSessionDataTask *task, id responseObject);
//typedef void(^LXAfterSuccess)(NSURLSessionDataTask *task, id responseObject);
typedef void(^LXBeforeFailure)(NSURLSessionDataTask *task, NSError *error);
//typedef void(^LXAfterFailure)(NSURLSessionDataTask *task, NSError *error);

typedef BOOL(^LXShouldRequest)(NSDictionary *params);
typedef BOOL(^LXShouldResponse)(NSDictionary *params);

@interface LXNetWorking : NSObject
{
    
}
/** <#注释#>*/
@property (nonatomic,copy)NSString *baseURLString;
/** <#注释#>*/
@property (nonatomic,assign)id<LXNetworkingManagerDelegate> delegate;
@property (nonatomic,assign)id<LXDataSourcesManager> dataSource;
@property (nonatomic,assign)id<LXParamValidatorManager> validator;
@property (nonatomic,assign)id<LXCallBackInterceptorManager> interceptor;

/** <#注释#>*/
//@property (nonatomic,assign)kLXSuccessBlock successBlock;
/** <#注释#>*/
//@property (nonatomic,assign)kLXFailureBlock failureBlock;
/** <#注释#>*/
//@property (nonatomic,assign)kLXProgressBlock progressBlock;
/** <#注释#>*/
//@property (nonatomic,assign)<#type#> <#typeName#>;

+ (instancetype)sharedInstance;


#pragma mark -
#pragma mark - GET
- (void)safeGET:(NSString *)apiName params:(NSDictionary *)params success:(void (^ _Nullable)(NSURLSessionDataTask * _Nonnull dataTask, id _Nullable responseObject))success;
- (void)GET:(NSString * _Nullable)apiName params:(NSDictionary * _Nullable)params success:(void (^ _Nullable)(NSURLSessionDataTask * _Nonnull dataTask, id _Nullable responseObject))success
    failure:(void (^ _Nullable)(NSURLSessionDataTask * _Nullable dataTask, NSError * _Nonnull error))failure;
#pragma mark -
#pragma mark - POST
- (void)safePOST:(NSString * _Nullable)apiName params:(NSDictionary * _Nullable)params success:(void (^ _Nullable)(NSURLSessionDataTask * _Nonnull dataTask, id _Nullable responseObject))success;
- (void)POST:(NSString * _Nullable)apiName params:(NSDictionary * _Nullable)params success:(void (^ _Nullable)(NSURLSessionDataTask * _Nonnull dataTask, id _Nullable responseObject))success
     failure:(void (^ _Nullable)(NSURLSessionDataTask * _Nullable dataTask, NSError * _Nonnull error))failure;

@end

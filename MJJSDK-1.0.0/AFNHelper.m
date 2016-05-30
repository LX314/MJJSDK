//
//  HTTPManager.m
//  CreditAssistant
//
//  Created by Stephen on 9/3/14.
//  Copyright (c) 2014 Stephen. All rights reserved.
//

#import "AFNHelper.h"

#import "AFURLSessionManager.h"


//Alert 消息
#ifndef kAFNAlertMSGNil
#define kAFNAlertMSGNil(__msg__) [[[UIAlertView alloc]initWithTitle:@"温馨提示" message:(__msg__) delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil]show]
#endif



@interface AFNHelper ()
{
    
}
@property (nonatomic, strong) NSMutableDictionary *defaultParams;

@end
@implementation AFNHelper

+ (instancetype)shareIntance
{
    static AFNHelper *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initWithBaseURL:[NSURL URLWithString:kBaseURLString]];
        instance.requestSerializer = [AFJSONRequestSerializer serializer];
        instance.responseSerializer = [AFJSONResponseSerializer serializer];
        instance.shouldUseCredentialStorage = YES;
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain", nil];
        //@"application/json", @"text/json", @"text/plain",@"text/javascript",c
    });
    return instance;
}

- (NSMutableDictionary *)defaultParams
{
    if (!_defaultParams) {
        _defaultParams = [[NSMutableDictionary alloc] init];
    }
    return _defaultParams;
}

#pragma mark -
#pragma mark - POST
/**
 *  @brief  POST[safe]请求
 *
 *  @param url     url
 *  @param params  参数
 *  @param message message
 *  @param success SuccessBlock
 */
+ (void)safePOST:(NSString *)url params:(NSDictionary *)params message:(NSString *)message success:(void (^)(id responseObject))success
{
    [AFNHelper basePOST:url params:params message:message inView:nil success:^(id responseObject) {
        //
        if (success) {
            success(responseObject);
        }
    } failure:nil];
}
/**
 *  @brief  POST请求
 *
 *  @param url     url
 *  @param params  参数
 *  @param message message
 *  @param inView  inView
 *  @param success SuccessBlock
 *  @param failure FailureBlock
 */
+ (void)POST:(NSString *)url params:(NSDictionary *)params message:(NSString *)message inView:(UIView *)inView success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [AFNHelper basePOST:url params:params message:message inView:inView success:^(id responseObject) {
        //
    } failure:^(NSError *error) {
        //
    }];
}
/**
 *  @brief  POST[base]请求
 *
 *  @param url     url
 *  @param params  参数
 *  @param message message
 *  @param inView  inView
 *  @param success SuccessBlock
 *  @param failure FailureBlock
 */
+ (void)basePOST:(NSString *)url params:(NSDictionary *)params message:(NSString *)message inView:(UIView *)inView success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
//    __weak UIView *weakView = inView;
    [[AFNHelper shareIntance] POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"///-->>%@",operation.responseString);
//        id jsonObject = [AFNHelper afnToJsonObject:responseObject];
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"///-->>%@",error.description);
        NSString *str = [[NSString alloc]initWithData:operation.responseData encoding:NSUTF8StringEncoding];
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:operation.responseData options:NSJSONReadingAllowFragments error:nil];
        if (failure) {
            failure(error);
        }
    }];
}

#pragma mark -
#pragma mark - GET
/**
 *  @brief  GET[safe]请求
 *
 *  @param url     url
 *  @param params  参数
 *  @param message message
 *  @param success SuccessBlock
 */
+ (void)safeGET:(NSString *)url params:(NSDictionary *)params message:(NSString *)message success:(void (^)(id responseObject))success
{
    [AFNHelper baseGET:url params:params message:message inView:nil success:^(id responseObject) {
        //
        if (success) {
            success(responseObject);
        }
    } failure:nil];
}
/**
 *  @brief  GET请求
 *
 *  @param url     url
 *  @param params  参数
 *  @param message message
 *  @param inView  inView
 *  @param success SuccessBlock
 *  @param failure FailureBlock
 */
+ (void)GET:(NSString *)url params:(NSDictionary *)params message:(NSString *)message inView:(UIView *)inView success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    [AFNHelper baseGET:url params:params message:message inView:inView success:^(id responseObject) {
        //
    } failure:^(NSError *error) {
        //
    }];
}
/**
 *  @brief  GET[base]请求
 *
 *  @param url     url
 *  @param params  参数
 *  @param message message
 *  @param inView  inView
 *  @param success SuccessBlock
 *  @param failure FailureBlock
 */
+ (void)baseGET:(NSString *)url params:(NSDictionary *)params message:(NSString *)message inView:(UIView *)inView success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure
{
    //    __weak UIView *weakView = inView;
    [[AFNHelper shareIntance] GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"///-->>%@",operation.responseString);
        //        id jsonObject = [AFNHelper afnToJsonObject:responseObject];
        if (success) {
            success(responseObject);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"///-->>%@",error.description);
        if (failure) {
            failure(error);
        }
    }];
}
#pragma mark -
#pragma mark - private
#pragma mark - Json/NSArray|NSDictionary
/**
 *  @brief  将 obj 转换为 Json 字符串
 *
 *  @param obj  json 对象
 *
 *  @return Json 字符串
 */
+ (NSString *)afnToJsonString:(id)obj
{
    if (![obj isKindOfClass:[NSDictionary class]] && ![obj isKindOfClass:[NSArray class]]) {
        return @"不能转换为 Json!";
    }
    NSError *toJsonError;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&toJsonError];
    if (toJsonError) {
        NSString *strMsg = toJsonError.description;
        NSLog(@"toJsonError:%@",strMsg);
        kAFNAlertMSGNil(strMsg);
        return nil;
    }
    NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}
/**
 *  @brief  将 json 字符串转换为 json 对象
 *
 *  @param jsonString json 字符串
 *
 *  @return json 对象
 */
+ (id)afnToJsonObject:(NSString *)jsonString
{
    NSError *error;
    id obj = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingMutableLeaves error:&error];
    if (error) {
        NSString *strMsg = error.description;
        NSLog(@"toJsonError:%@",strMsg);
        kAFNAlertMSGNil(strMsg);
        return nil;
    }
    return obj;
}

@end

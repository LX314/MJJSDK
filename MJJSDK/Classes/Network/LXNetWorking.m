//
//  LXNetWorking.m
//  LXNetWorking
//
//  Created by John LXThyme on 16/5/10.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "LXNetWorking.h"

static NSString * const kLXURLCacheExpirationKey = @"CustomURLCacheExpiration";
static NSTimeInterval const kLXURLCacheExpirationInterval = 600;


@interface LXNetWorking ()<NSURLSessionDataDelegate>
{
    
}
/** <#注释#>*/
@property (nonatomic,retain)AFHTTPSessionManager *manager;
/** <#注释#>*/
@property (nonatomic,retain)NSURLCache *cache;

@end
@implementation LXNetWorking

+ (instancetype)sharedInstance {
    static LXNetWorking *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[[self class] alloc]init];
    });
    
    return _sharedInstance;
}
- (void)initial{
    //网络请求时状态栏网络状态小转轮
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
}
- (NSDictionary *)mergeParams:(NSDictionary *)params_t{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params addEntriesFromDictionary:params_t];
    if ([self.dataSource respondsToSelector:@selector(commonParams)]) {
        [params addEntriesFromDictionary:[self.dataSource commonParams]];
    }
    return [params copy];
}

#pragma mark -
#pragma mark - GET
- (void)safeGET:(NSString *)apiName params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
{
    [self GET:apiName params:params success:success failure:^(NSURLSessionDataTask * _Nullable dataTask, NSError * _Nonnull error) {
        //
    }];
}
- (void)GET:(NSString *)apiName params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
        failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    [self baseGET:apiName params:params success:success failure:failure];
}
- (void)baseGET:(NSString *)apiName params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
     failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    params = [self mergeParams:params];
    [self.manager GET:apiName parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        //
        NSLog(@"Progress:%@",downloadProgress.localizedDescription);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        NSLog(@"成功");
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        NSLog(@"失败ERROR:%@",error);
        if (failure) {
            failure(task, error);
        }
    }];
    //    [self testBlock];
}

#pragma mark -
#pragma mark - POST
- (void)safePOST:(NSString *)apiName params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
{
    [self POST:apiName params:params success:success failure:^(NSURLSessionDataTask * _Nullable dataTask, NSError * _Nonnull error) {
        //
    }];
}
- (void)POST:(NSString *)apiName params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
         failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure
{
    [self basePOST:apiName params:params success:success failure:failure];
}
- (void)basePOST:(NSString *)apiName params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
         failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{
    params = [self mergeParams:params];
    [self.manager POST:apiName parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        //
        NSLog(@"Progress:%@",downloadProgress.localizedDescription);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        NSLog(@"成功");
        if (success) {
            success(task, responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        NSLog(@"失败ERROR:%@",error);
        if (failure) {
            failure(task, error);
        }
    }];
//    [self testBlock];
}
- (void)testBlock {
    //
    __weak __typeof(&*self)weakSelf = self;
    
    [self.manager setSessionDidBecomeInvalidBlock:^(NSURLSession * _Nonnull session, NSError * _Nonnull error) {
        //
        NSLog(@"1`setSessionDidBecomeInvalidBlock");
    }];
    [self.manager setSessionDidReceiveAuthenticationChallengeBlock:^NSURLSessionAuthChallengeDisposition(NSURLSession * _Nonnull session, NSURLAuthenticationChallenge * _Nonnull challenge, NSURLCredential *__autoreleasing  _Nullable * _Nullable credential) {
        //
        NSLog(@"2`setSessionDidReceiveAuthenticationChallengeBlock");
        return NSURLSessionAuthChallengePerformDefaultHandling;
    }];
    [self.manager setDidFinishEventsForBackgroundURLSessionBlock:^(NSURLSession * _Nonnull session) {
        //
        NSLog(@"3`setDidFinishEventsForBackgroundURLSessionBlock");
    }];
    [self.manager setTaskWillPerformHTTPRedirectionBlock:^NSURLRequest * _Nonnull(NSURLSession * _Nonnull session, NSURLSessionTask * _Nonnull task, NSURLResponse * _Nonnull response, NSURLRequest * _Nonnull request) {
        //
        NSLog(@"4`setTaskWillPerformHTTPRedirectionBlock");
        return request;
    }];
    [self.manager setTaskDidReceiveAuthenticationChallengeBlock:^NSURLSessionAuthChallengeDisposition(NSURLSession * _Nonnull session, NSURLSessionTask * _Nonnull task, NSURLAuthenticationChallenge * _Nonnull challenge, NSURLCredential *__autoreleasing  _Nullable * _Nullable credential) {
        //
        NSLog(@"5`setTaskDidReceiveAuthenticationChallengeBlock");
        return NSURLSessionAuthChallengePerformDefaultHandling;
    }];
//    [self.manager setTaskNeedNewBodyStreamBlock:^NSInputStream * _Nonnull(NSURLSession * _Nonnull session, NSURLSessionTask * _Nonnull task) {
//        //
//        NSLog(@"6`setTaskNeedNewBodyStreamBlock");
//    }];
    [self.manager setTaskDidSendBodyDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionTask * _Nonnull task, int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
        //
        NSLog(@"7`setTaskDidSendBodyDataBlock");
    }];
    [self.manager setTaskDidCompleteBlock:^(NSURLSession * _Nonnull session, NSURLSessionTask * _Nonnull task, NSError * _Nullable error) {
        //
        NSLog(@"8`setTaskDidCompleteBlock");
    }];
//    [self.manager setDataTaskDidReceiveResponseBlock:^NSURLSessionResponseDisposition(NSURLSession * _Nonnull session, NSURLSessionDataTask * _Nonnull dataTask, NSURLResponse * _Nonnull response) {
//        //
//        NSLog(@"9`setDataTaskDidReceiveResponseBlock");
//        return NSURLSessionResponseAllow;
//    }];
    [self.manager setDataTaskDidBecomeDownloadTaskBlock:^(NSURLSession * _Nonnull session, NSURLSessionDataTask * _Nonnull dataTask, NSURLSessionDownloadTask * _Nonnull downloadTask) {
        //
        NSLog(@"10`setDataTaskDidBecomeDownloadTaskBlock");
    }];
    [self.manager setDataTaskDidReceiveDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionDataTask * _Nonnull dataTask, NSData * _Nonnull data) {
        //
        NSLog(@"11`setDataTaskDidReceiveDataBlock");
    }];
    [self.manager setDataTaskWillCacheResponseBlock:^NSCachedURLResponse * _Nonnull(NSURLSession * _Nonnull session, NSURLSessionDataTask * _Nonnull dataTask, NSCachedURLResponse * _Nonnull proposedResponse) {
        //
        NSLog(@"12`[缓存...]setDataTaskWillCacheResponseBlock");
        return proposedResponse;
    }];
//    [self.manager setDownloadTaskDidFinishDownloadingBlock:^NSURL * _Nullable(NSURLSession * _Nonnull session, NSURLSessionDownloadTask * _Nonnull downloadTask, NSURL * _Nonnull location) {
//        NSLog(@"13`setDownloadTaskDidFinishDownloadingBlock");
//        //
//    }];
    [self.manager setDownloadTaskDidWriteDataBlock:^(NSURLSession * _Nonnull session, NSURLSessionDownloadTask * _Nonnull downloadTask, int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
        //
        NSLog(@"14`setDownloadTaskDidWriteDataBlock");
    }];
    [self.manager setDownloadTaskDidResumeBlock:^(NSURLSession * _Nonnull session, NSURLSessionDownloadTask * _Nonnull downloadTask, int64_t fileOffset, int64_t expectedTotalBytes) {
        //
        NSLog(@"15`setDownloadTaskDidResumeBlock");
    }];
    
}



#pragma mark -
#pragma mark - NSURLSessionDataDelegate
//- (void)URLSession:(NSURLSession *)session dataTask:(nonnull NSURLSessionDataTask *)dataTask willCacheResponse:(nonnull NSCachedURLResponse *)proposedResponse completionHandler:(nonnull void (^)(NSCachedURLResponse * _Nullable))completionHandler{
//}
#pragma mark - manager
- (AFHTTPSessionManager *)manager
{
//    if (_manager.baseURL.relativeString) {
//        return _manager;
//    }
    //ttp://baike.baidu.com/api/openapi/BaikeLemmaCardApi?scope=103&format=json&appid=379020&bk_key=%E5%88%98%E8%AF%97%E8%AF%97&bk_length=600
    if(!_manager){
        
        NSString *urlString = @"";
        if ([self.dataSource respondsToSelector:@selector(baseUrl)]) {
            urlString = [self.dataSource baseUrl];
        }
        NSURL *url = [NSURL URLWithString:urlString];

        
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        _manager = [[AFHTTPSessionManager alloc]initWithBaseURL:url sessionConfiguration:sessionConfiguration];
//        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/plain",@"text/javascript",@"text/html", nil];
        //@"application/json", @"text/json", @"text/plain",@"text/javascript",@"text/html"
        [_manager.requestSerializer setValue:@"application/json"forHTTPHeaderField:@"Accept"];
        [_manager.requestSerializer setValue:@"application/json;charset=utf-8"forHTTPHeaderField:@"Content-Type"];
        _manager.requestSerializer.cachePolicy =
//        NSURLRequestReturnCacheDataElseLoad;
//        NSURLRequestReturnCacheDataDontLoad;
        NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
        _manager.requestSerializer.timeoutInterval = 60.f;
        _manager.securityPolicy.allowInvalidCertificates = YES;

    }
    
    return _manager;
}
#pragma mark - cache
- (NSURLCache *)cache
{
    if(!_cache){
        _cache = [NSURLCache sharedURLCache];
        
    }
    
    return _cache;
}

#pragma mark - setter/getter
- (void)setBaseURLString:(NSString *)baseURLString{
    if ([_baseURLString isEqualToString:baseURLString]) {
        return;
    }
    _baseURLString = baseURLString;
    _manager = nil;
    self.manager;
}

- (void)dealloc{
    NSLog(@"dealloc");
}

@end

//
//  LXTool.m
//  Pods
//
//  Created by John LXThyme on 16/5/23.
//
//

#import "LXTool.h"

@interface LXTool ()
{
    
}
/** <#注释#>*/
@property (nonatomic,retain)AFHTTPSessionManager *manager;

@end
@implementation LXTool

+ (instancetype)sharedInstance {
    static LXTool *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[[self class] alloc]init];
    });
    
    return _sharedInstance;
}
+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask * _Nonnull dataTask, id _Nullable responseObject))success
    failure:(void (^)(NSURLSessionDataTask * _Nullable dataTask, NSError * _Nonnull error))failure
{
    [[LXTool sharedInstance]get:url params:params success:success failure:failure];
}
- (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask * _Nonnull dataTask, id _Nullable responseObject))success
    failure:(void (^)(NSURLSessionDataTask * _Nullable dataTask, NSError * _Nonnull error))failure{
    //[self test];
    [self.manager GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
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
}
#pragma mark - manager
- (AFHTTPSessionManager *)manager
{
    //ttp://baike.baidu.com/api/openapi/BaikeLemmaCardApi?scope=103&format=json&appid=379020&bk_key=%E5%88%98%E8%AF%97%E8%AF%97&bk_length=600
    if(!_manager){
        NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
        NSURL *url = [NSURL URLWithString:@""];
        _manager = [[AFHTTPSessionManager alloc]initWithBaseURL:url sessionConfiguration:sessionConfiguration];
        _manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json",@"text/plain", nil];
        //@"application/json", @"text/json", @"text/plain",@"text/javascript",@"text/html"
        _manager.requestSerializer.cachePolicy =
        //        NSURLRequestReturnCacheDataElseLoad;
        //        NSURLRequestReturnCacheDataDontLoad;
        NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
        _manager.requestSerializer.timeoutInterval = 60.f;
        
    }
    
    return _manager;
}
@end

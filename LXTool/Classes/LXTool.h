//
//  LXTool.h
//  Pods
//
//  Created by John LXThyme on 16/5/23.
//
//

#import <Foundation/Foundation.h>


#import <AFNetworking/AFNetworking.h>

@interface LXTool : NSObject
{
    
}


+ (void)get:(NSString *)url params:(NSDictionary *)params success:(void (^)(NSURLSessionDataTask * _Nonnull dataTask, id _Nullable responseObject))success
    failure:(void (^)(NSURLSessionDataTask * _Nullable dataTask, NSError * _Nonnull error))failure;

@end

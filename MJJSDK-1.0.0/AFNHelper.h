//
//  HTTPManager.h
//  CreditAssistant
//
//  Created by Stephen on 9/3/14.
//  Copyright (c) 2014 Stephen. All rights reserved.
//

#import "AFHTTPRequestOperationManager.h"

typedef void(^kSuccessBlock)(NSURLResponse *response, NSURL *filePath, NSError *error);
typedef void(^kFailureBlock)(NSError *error);

#warning here shoud be setting the baseURL...
#define kBaseURLString @""

@interface AFNHelper : AFHTTPRequestOperationManager
{
    
}



+ (instancetype)shareIntance;
+ (void)safePOST:(NSString *)url params:(NSDictionary *)params message:(NSString *)message success:(void (^)(id responseObject))success;





@end

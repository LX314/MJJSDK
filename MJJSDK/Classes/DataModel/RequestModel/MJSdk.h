//
//  MJSdk.h
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MJSdk : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *checkcode;
@property (nonatomic, strong) NSString *sdkVersion;
@property (nonatomic, strong) NSString *timestamp;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

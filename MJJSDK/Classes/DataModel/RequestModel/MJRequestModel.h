//
//  MJRequestModel.h
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MJDevice, MJApp, MJImpression, MJSdk, MJUser;

@interface MJRequestModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) MJDevice *device;
@property (nonatomic, strong) MJApp *app;
@property (nonatomic, strong) MJImpression *impression;
@property (nonatomic, assign) double testType;
@property (nonatomic, strong) NSString *eventId;
@property (nonatomic, strong) MJSdk *sdk;
@property (nonatomic, strong) MJUser *user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

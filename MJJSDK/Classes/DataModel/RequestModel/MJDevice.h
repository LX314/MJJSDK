//
//  MJDevice.h
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MJGeo;

@interface MJDevice : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double pixelWidth;
@property (nonatomic, assign) double deviceOrientation;
@property (nonatomic, strong) NSString *physicalSize;
@property (nonatomic, strong) NSString *isJsEnabled;
@property (nonatomic, assign) double pixelHeight;
@property (nonatomic, strong) NSString *isRooted;
@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) NSString *isFlashEnabled;
@property (nonatomic, strong) NSString *os;
@property (nonatomic, assign) double deviceType;
@property (nonatomic, assign) double platform;
@property (nonatomic, strong) NSString *ip;
@property (nonatomic, strong) MJGeo *geo;
@property (nonatomic, assign) double networkConnectionType;
@property (nonatomic, strong) NSString *userAgent;
@property (nonatomic, strong) NSString *model;
@property (nonatomic, strong) NSString *osVersion;
@property (nonatomic, strong) NSString *carrierId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

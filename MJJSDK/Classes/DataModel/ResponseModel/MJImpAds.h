//
//  MJImpAds.h
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MJBannerAds, MJApps;

@interface MJImpAds : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) MJBannerAds *bannerAds;
@property (nonatomic, strong) NSArray *showTrackingUrls;
@property (nonatomic, strong) NSString *impressionAd;
@property (nonatomic, assign) double adType;
@property (nonatomic, strong) MJApps *apps;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

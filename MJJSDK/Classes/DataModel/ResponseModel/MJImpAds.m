//
//  MJImpAds.m
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MJImpAds.h"
#import "MJBannerAds.h"
#import "MJApps.h"


NSString *const kMJImpAdsBannerAds = @"banner_ads";
NSString *const kMJImpAdsShowTrackingUrls = @"show_tracking_urls";
NSString *const kMJImpAdsImpressionAd = @"ImpressionAd";
NSString *const kMJImpAdsAdType = @"ad_type";
NSString *const kMJImpAdsApps = @"apps";


@interface MJImpAds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MJImpAds

@synthesize bannerAds = _bannerAds;
@synthesize showTrackingUrls = _showTrackingUrls;
@synthesize impressionAd = _impressionAd;
@synthesize adType = _adType;
@synthesize apps = _apps;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.bannerAds = [MJBannerAds modelObjectWithDictionary:[dict objectForKey:kMJImpAdsBannerAds]];
            self.showTrackingUrls = [self objectOrNilForKey:kMJImpAdsShowTrackingUrls fromDictionary:dict];
            self.impressionAd = [self objectOrNilForKey:kMJImpAdsImpressionAd fromDictionary:dict];
            self.adType = [[self objectOrNilForKey:kMJImpAdsAdType fromDictionary:dict] doubleValue];
            self.apps = [MJApps modelObjectWithDictionary:[dict objectForKey:kMJImpAdsApps]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.bannerAds dictionaryRepresentation] forKey:kMJImpAdsBannerAds];
    NSMutableArray *tempArrayForShowTrackingUrls = [NSMutableArray array];
    for (NSObject *subArrayObject in self.showTrackingUrls) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForShowTrackingUrls addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForShowTrackingUrls addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForShowTrackingUrls] forKey:kMJImpAdsShowTrackingUrls];
    [mutableDict setValue:self.impressionAd forKey:kMJImpAdsImpressionAd];
    [mutableDict setValue:[NSNumber numberWithDouble:self.adType] forKey:kMJImpAdsAdType];
    [mutableDict setValue:[self.apps dictionaryRepresentation] forKey:kMJImpAdsApps];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.bannerAds = [aDecoder decodeObjectForKey:kMJImpAdsBannerAds];
    self.showTrackingUrls = [aDecoder decodeObjectForKey:kMJImpAdsShowTrackingUrls];
    self.impressionAd = [aDecoder decodeObjectForKey:kMJImpAdsImpressionAd];
    self.adType = [aDecoder decodeDoubleForKey:kMJImpAdsAdType];
    self.apps = [aDecoder decodeObjectForKey:kMJImpAdsApps];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_bannerAds forKey:kMJImpAdsBannerAds];
    [aCoder encodeObject:_showTrackingUrls forKey:kMJImpAdsShowTrackingUrls];
    [aCoder encodeObject:_impressionAd forKey:kMJImpAdsImpressionAd];
    [aCoder encodeDouble:_adType forKey:kMJImpAdsAdType];
    [aCoder encodeObject:_apps forKey:kMJImpAdsApps];
}

- (id)copyWithZone:(NSZone *)zone
{
    MJImpAds *copy = [[MJImpAds alloc] init];
    
    if (copy) {

        copy.bannerAds = [self.bannerAds copyWithZone:zone];
        copy.showTrackingUrls = [self.showTrackingUrls copyWithZone:zone];
        copy.impressionAd = [self.impressionAd copyWithZone:zone];
        copy.adType = self.adType;
        copy.apps = [self.apps copyWithZone:zone];
    }
    
    return copy;
}


@end

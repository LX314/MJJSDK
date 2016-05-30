//
//  MJBannerAds.m
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MJBannerAds.h"


NSString *const kMJBannerAdsAppName = @"app_name";
NSString *const kMJBannerAdsClickUrl = @"click_url";
NSString *const kMJBannerAdsBtnUrl = @"btn_url";
NSString *const kMJBannerAdsAppDescription = @"app_description";
NSString *const kMJBannerAdsLogoUrl = @"logo_url";
NSString *const kMJBannerAdsImgUrl = @"img_url";
NSString *const kMJBannerAdsHttpSnippet = @"http_snippet";
NSString *const kMJBannerAdsProductType = @"product_type";
NSString *const kMJBannerAdsType = @"type";


@interface MJBannerAds ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MJBannerAds

@synthesize appName = _appName;
@synthesize clickUrl = _clickUrl;
@synthesize btnUrl = _btnUrl;
@synthesize appDescription = _appDescription;
@synthesize logoUrl = _logoUrl;
@synthesize imgUrl = _imgUrl;
@synthesize httpSnippet = _httpSnippet;
@synthesize productType = _productType;
@synthesize type = _type;


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
            self.appName = [self objectOrNilForKey:kMJBannerAdsAppName fromDictionary:dict];
            self.clickUrl = [self objectOrNilForKey:kMJBannerAdsClickUrl fromDictionary:dict];
            self.btnUrl = [self objectOrNilForKey:kMJBannerAdsBtnUrl fromDictionary:dict];
            self.appDescription = [self objectOrNilForKey:kMJBannerAdsAppDescription fromDictionary:dict];
            self.logoUrl = [self objectOrNilForKey:kMJBannerAdsLogoUrl fromDictionary:dict];
            self.imgUrl = [self objectOrNilForKey:kMJBannerAdsImgUrl fromDictionary:dict];
            self.httpSnippet = [self objectOrNilForKey:kMJBannerAdsHttpSnippet fromDictionary:dict];
            self.productType = [[self objectOrNilForKey:kMJBannerAdsProductType fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kMJBannerAdsType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.appName forKey:kMJBannerAdsAppName];
    [mutableDict setValue:self.clickUrl forKey:kMJBannerAdsClickUrl];
    [mutableDict setValue:self.btnUrl forKey:kMJBannerAdsBtnUrl];
    [mutableDict setValue:self.appDescription forKey:kMJBannerAdsAppDescription];
    [mutableDict setValue:self.logoUrl forKey:kMJBannerAdsLogoUrl];
    [mutableDict setValue:self.imgUrl forKey:kMJBannerAdsImgUrl];
    [mutableDict setValue:self.httpSnippet forKey:kMJBannerAdsHttpSnippet];
    [mutableDict setValue:[NSNumber numberWithDouble:self.productType] forKey:kMJBannerAdsProductType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kMJBannerAdsType];

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

    self.appName = [aDecoder decodeObjectForKey:kMJBannerAdsAppName];
    self.clickUrl = [aDecoder decodeObjectForKey:kMJBannerAdsClickUrl];
    self.btnUrl = [aDecoder decodeObjectForKey:kMJBannerAdsBtnUrl];
    self.appDescription = [aDecoder decodeObjectForKey:kMJBannerAdsAppDescription];
    self.logoUrl = [aDecoder decodeObjectForKey:kMJBannerAdsLogoUrl];
    self.imgUrl = [aDecoder decodeObjectForKey:kMJBannerAdsImgUrl];
    self.httpSnippet = [aDecoder decodeObjectForKey:kMJBannerAdsHttpSnippet];
    self.productType = [aDecoder decodeDoubleForKey:kMJBannerAdsProductType];
    self.type = [aDecoder decodeDoubleForKey:kMJBannerAdsType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_appName forKey:kMJBannerAdsAppName];
    [aCoder encodeObject:_clickUrl forKey:kMJBannerAdsClickUrl];
    [aCoder encodeObject:_btnUrl forKey:kMJBannerAdsBtnUrl];
    [aCoder encodeObject:_appDescription forKey:kMJBannerAdsAppDescription];
    [aCoder encodeObject:_logoUrl forKey:kMJBannerAdsLogoUrl];
    [aCoder encodeObject:_imgUrl forKey:kMJBannerAdsImgUrl];
    [aCoder encodeObject:_httpSnippet forKey:kMJBannerAdsHttpSnippet];
    [aCoder encodeDouble:_productType forKey:kMJBannerAdsProductType];
    [aCoder encodeDouble:_type forKey:kMJBannerAdsType];
}

- (id)copyWithZone:(NSZone *)zone
{
    MJBannerAds *copy = [[MJBannerAds alloc] init];
    
    if (copy) {

        copy.appName = [self.appName copyWithZone:zone];
        copy.clickUrl = [self.clickUrl copyWithZone:zone];
        copy.btnUrl = [self.btnUrl copyWithZone:zone];
        copy.appDescription = [self.appDescription copyWithZone:zone];
        copy.logoUrl = [self.logoUrl copyWithZone:zone];
        copy.imgUrl = [self.imgUrl copyWithZone:zone];
        copy.httpSnippet = [self.httpSnippet copyWithZone:zone];
        copy.productType = self.productType;
        copy.type = self.type;
    }
    
    return copy;
}


@end

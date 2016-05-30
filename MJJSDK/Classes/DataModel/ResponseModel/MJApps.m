//
//  MJApps.m
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MJApps.h"


NSString *const kMJAppsAppNam = @"app_nam";
NSString *const kMJAppsBtnUrl = @"btn_url";
NSString *const kMJAppsClickUrl = @"click_url";
NSString *const kMJAppsProductType = @"product_type";
NSString *const kMJAppsLogoUrl = @"logo_url";
NSString *const kMJAppsAppDescription = @"app_description";


@interface MJApps ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MJApps

@synthesize appNam = _appNam;
@synthesize btnUrl = _btnUrl;
@synthesize clickUrl = _clickUrl;
@synthesize productType = _productType;
@synthesize logoUrl = _logoUrl;
@synthesize appDescription = _appDescription;


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
            self.appNam = [self objectOrNilForKey:kMJAppsAppNam fromDictionary:dict];
            self.btnUrl = [self objectOrNilForKey:kMJAppsBtnUrl fromDictionary:dict];
            self.clickUrl = [self objectOrNilForKey:kMJAppsClickUrl fromDictionary:dict];
            self.productType = [[self objectOrNilForKey:kMJAppsProductType fromDictionary:dict] doubleValue];
            self.logoUrl = [self objectOrNilForKey:kMJAppsLogoUrl fromDictionary:dict];
            self.appDescription = [self objectOrNilForKey:kMJAppsAppDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.appNam forKey:kMJAppsAppNam];
    [mutableDict setValue:self.btnUrl forKey:kMJAppsBtnUrl];
    [mutableDict setValue:self.clickUrl forKey:kMJAppsClickUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.productType] forKey:kMJAppsProductType];
    [mutableDict setValue:self.logoUrl forKey:kMJAppsLogoUrl];
    [mutableDict setValue:self.appDescription forKey:kMJAppsAppDescription];

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

    self.appNam = [aDecoder decodeObjectForKey:kMJAppsAppNam];
    self.btnUrl = [aDecoder decodeObjectForKey:kMJAppsBtnUrl];
    self.clickUrl = [aDecoder decodeObjectForKey:kMJAppsClickUrl];
    self.productType = [aDecoder decodeDoubleForKey:kMJAppsProductType];
    self.logoUrl = [aDecoder decodeObjectForKey:kMJAppsLogoUrl];
    self.appDescription = [aDecoder decodeObjectForKey:kMJAppsAppDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_appNam forKey:kMJAppsAppNam];
    [aCoder encodeObject:_btnUrl forKey:kMJAppsBtnUrl];
    [aCoder encodeObject:_clickUrl forKey:kMJAppsClickUrl];
    [aCoder encodeDouble:_productType forKey:kMJAppsProductType];
    [aCoder encodeObject:_logoUrl forKey:kMJAppsLogoUrl];
    [aCoder encodeObject:_appDescription forKey:kMJAppsAppDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    MJApps *copy = [[MJApps alloc] init];
    
    if (copy) {

        copy.appNam = [self.appNam copyWithZone:zone];
        copy.btnUrl = [self.btnUrl copyWithZone:zone];
        copy.clickUrl = [self.clickUrl copyWithZone:zone];
        copy.productType = self.productType;
        copy.logoUrl = [self.logoUrl copyWithZone:zone];
        copy.appDescription = [self.appDescription copyWithZone:zone];
    }
    
    return copy;
}


@end

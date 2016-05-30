//
//  MJGeo.m
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MJGeo.h"


NSString *const kMJGeoLongitude = @"longitude";
NSString *const kMJGeoLatitude = @"latitude";


@interface MJGeo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MJGeo

@synthesize longitude = _longitude;
@synthesize latitude = _latitude;


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
            self.longitude = [self objectOrNilForKey:kMJGeoLongitude fromDictionary:dict];
            self.latitude = [self objectOrNilForKey:kMJGeoLatitude fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.longitude forKey:kMJGeoLongitude];
    [mutableDict setValue:self.latitude forKey:kMJGeoLatitude];

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

    self.longitude = [aDecoder decodeObjectForKey:kMJGeoLongitude];
    self.latitude = [aDecoder decodeObjectForKey:kMJGeoLatitude];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_longitude forKey:kMJGeoLongitude];
    [aCoder encodeObject:_latitude forKey:kMJGeoLatitude];
}

- (id)copyWithZone:(NSZone *)zone
{
    MJGeo *copy = [[MJGeo alloc] init];
    
    if (copy) {

        copy.longitude = [self.longitude copyWithZone:zone];
        copy.latitude = [self.latitude copyWithZone:zone];
    }
    
    return copy;
}


@end

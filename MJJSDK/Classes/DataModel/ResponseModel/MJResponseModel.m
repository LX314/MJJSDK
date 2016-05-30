//
//  MJResponseModel.m
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MJResponseModel.h"
#import "MJImpAds.h"


NSString *const kMJResponseModelEventId = @"event_id";
NSString *const kMJResponseModelImpAds = @"imp_ads";
NSString *const kMJResponseModel = @"";


@interface MJResponseModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MJResponseModel

@synthesize eventId = _eventId;
@synthesize impAds = _impAds;
@synthesize myProperty1 = _myProperty1;


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
            self.eventId = [self objectOrNilForKey:kMJResponseModelEventId fromDictionary:dict];
            self.impAds = [MJImpAds modelObjectWithDictionary:[dict objectForKey:kMJResponseModelImpAds]];
            self.myProperty1 = [self objectOrNilForKey:kMJResponseModel fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.eventId forKey:kMJResponseModelEventId];
    [mutableDict setValue:[self.impAds dictionaryRepresentation] forKey:kMJResponseModelImpAds];
    [mutableDict setValue:self.myProperty1 forKey:kMJResponseModel];

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

    self.eventId = [aDecoder decodeObjectForKey:kMJResponseModelEventId];
    self.impAds = [aDecoder decodeObjectForKey:kMJResponseModelImpAds];
    self.myProperty1 = [aDecoder decodeObjectForKey:kMJResponseModel];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_eventId forKey:kMJResponseModelEventId];
    [aCoder encodeObject:_impAds forKey:kMJResponseModelImpAds];
    [aCoder encodeObject:_myProperty1 forKey:kMJResponseModel];
}

- (id)copyWithZone:(NSZone *)zone
{
    MJResponseModel *copy = [[MJResponseModel alloc] init];
    
    if (copy) {

        copy.eventId = [self.eventId copyWithZone:zone];
        copy.impAds = [self.impAds copyWithZone:zone];
        copy.myProperty1 = [self.myProperty1 copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  MJImpression.m
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MJImpression.h"


NSString *const kMJImpressionImpId = @"imp_id";
NSString *const kMJImpressionAdspaceId = @"adspace_id";
NSString *const kMJImpressionAdCount = @"ad_count";


@interface MJImpression ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MJImpression

@synthesize impId = _impId;
@synthesize adspaceId = _adspaceId;
@synthesize adCount = _adCount;


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
            self.impId = [self objectOrNilForKey:kMJImpressionImpId fromDictionary:dict];
            self.adspaceId = [self objectOrNilForKey:kMJImpressionAdspaceId fromDictionary:dict];
            self.adCount = [self objectOrNilForKey:kMJImpressionAdCount fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.impId forKey:kMJImpressionImpId];
    [mutableDict setValue:self.adspaceId forKey:kMJImpressionAdspaceId];
    [mutableDict setValue:self.adCount forKey:kMJImpressionAdCount];

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

    self.impId = [aDecoder decodeObjectForKey:kMJImpressionImpId];
    self.adspaceId = [aDecoder decodeObjectForKey:kMJImpressionAdspaceId];
    self.adCount = [aDecoder decodeObjectForKey:kMJImpressionAdCount];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_impId forKey:kMJImpressionImpId];
    [aCoder encodeObject:_adspaceId forKey:kMJImpressionAdspaceId];
    [aCoder encodeObject:_adCount forKey:kMJImpressionAdCount];
}

- (id)copyWithZone:(NSZone *)zone
{
    MJImpression *copy = [[MJImpression alloc] init];
    
    if (copy) {

        copy.impId = [self.impId copyWithZone:zone];
        copy.adspaceId = [self.adspaceId copyWithZone:zone];
        copy.adCount = [self.adCount copyWithZone:zone];
    }
    
    return copy;
}


@end

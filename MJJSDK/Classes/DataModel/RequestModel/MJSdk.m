//
//  MJSdk.m
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MJSdk.h"


NSString *const kMJSdkCheckcode = @"checkcode";
NSString *const kMJSdkSdkVersion = @"sdk_version";
NSString *const kMJSdkTimestamp = @"timestamp";


@interface MJSdk ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MJSdk

@synthesize checkcode = _checkcode;
@synthesize sdkVersion = _sdkVersion;
@synthesize timestamp = _timestamp;


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
            self.checkcode = [self objectOrNilForKey:kMJSdkCheckcode fromDictionary:dict];
            self.sdkVersion = [self objectOrNilForKey:kMJSdkSdkVersion fromDictionary:dict];
            self.timestamp = [self objectOrNilForKey:kMJSdkTimestamp fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.checkcode forKey:kMJSdkCheckcode];
    [mutableDict setValue:self.sdkVersion forKey:kMJSdkSdkVersion];
    [mutableDict setValue:self.timestamp forKey:kMJSdkTimestamp];

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

    self.checkcode = [aDecoder decodeObjectForKey:kMJSdkCheckcode];
    self.sdkVersion = [aDecoder decodeObjectForKey:kMJSdkSdkVersion];
    self.timestamp = [aDecoder decodeObjectForKey:kMJSdkTimestamp];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_checkcode forKey:kMJSdkCheckcode];
    [aCoder encodeObject:_sdkVersion forKey:kMJSdkSdkVersion];
    [aCoder encodeObject:_timestamp forKey:kMJSdkTimestamp];
}

- (id)copyWithZone:(NSZone *)zone
{
    MJSdk *copy = [[MJSdk alloc] init];
    
    if (copy) {

        copy.checkcode = [self.checkcode copyWithZone:zone];
        copy.sdkVersion = [self.sdkVersion copyWithZone:zone];
        copy.timestamp = [self.timestamp copyWithZone:zone];
    }
    
    return copy;
}


@end

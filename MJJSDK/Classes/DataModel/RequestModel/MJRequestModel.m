//
//  MJRequestModel.m
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MJRequestModel.h"
#import "MJDevice.h"
#import "MJApp.h"
#import "MJImpression.h"
#import "MJSdk.h"
#import "MJUser.h"


NSString *const kMJRequestModelDevice = @"device";
NSString *const kMJRequestModelApp = @"app";
NSString *const kMJRequestModelImpression = @"impression";
NSString *const kMJRequestModelTestType = @"test_type";
NSString *const kMJRequestModelEventId = @"event_id";
NSString *const kMJRequestModelSdk = @"sdk";
NSString *const kMJRequestModelUser = @"user";


@interface MJRequestModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MJRequestModel

@synthesize device = _device;
@synthesize app = _app;
@synthesize impression = _impression;
@synthesize testType = _testType;
@synthesize eventId = _eventId;
@synthesize sdk = _sdk;
@synthesize user = _user;


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
            self.device = [MJDevice modelObjectWithDictionary:[dict objectForKey:kMJRequestModelDevice]];
            self.app = [MJApp modelObjectWithDictionary:[dict objectForKey:kMJRequestModelApp]];
            self.impression = [MJImpression modelObjectWithDictionary:[dict objectForKey:kMJRequestModelImpression]];
            self.testType = [[self objectOrNilForKey:kMJRequestModelTestType fromDictionary:dict] doubleValue];
            self.eventId = [self objectOrNilForKey:kMJRequestModelEventId fromDictionary:dict];
            self.sdk = [MJSdk modelObjectWithDictionary:[dict objectForKey:kMJRequestModelSdk]];
            self.user = [MJUser modelObjectWithDictionary:[dict objectForKey:kMJRequestModelUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.device dictionaryRepresentation] forKey:kMJRequestModelDevice];
    [mutableDict setValue:[self.app dictionaryRepresentation] forKey:kMJRequestModelApp];
    [mutableDict setValue:[self.impression dictionaryRepresentation] forKey:kMJRequestModelImpression];
    [mutableDict setValue:[NSNumber numberWithDouble:self.testType] forKey:kMJRequestModelTestType];
    [mutableDict setValue:self.eventId forKey:kMJRequestModelEventId];
    [mutableDict setValue:[self.sdk dictionaryRepresentation] forKey:kMJRequestModelSdk];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kMJRequestModelUser];

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

    self.device = [aDecoder decodeObjectForKey:kMJRequestModelDevice];
    self.app = [aDecoder decodeObjectForKey:kMJRequestModelApp];
    self.impression = [aDecoder decodeObjectForKey:kMJRequestModelImpression];
    self.testType = [aDecoder decodeDoubleForKey:kMJRequestModelTestType];
    self.eventId = [aDecoder decodeObjectForKey:kMJRequestModelEventId];
    self.sdk = [aDecoder decodeObjectForKey:kMJRequestModelSdk];
    self.user = [aDecoder decodeObjectForKey:kMJRequestModelUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_device forKey:kMJRequestModelDevice];
    [aCoder encodeObject:_app forKey:kMJRequestModelApp];
    [aCoder encodeObject:_impression forKey:kMJRequestModelImpression];
    [aCoder encodeDouble:_testType forKey:kMJRequestModelTestType];
    [aCoder encodeObject:_eventId forKey:kMJRequestModelEventId];
    [aCoder encodeObject:_sdk forKey:kMJRequestModelSdk];
    [aCoder encodeObject:_user forKey:kMJRequestModelUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    MJRequestModel *copy = [[MJRequestModel alloc] init];
    
    if (copy) {

        copy.device = [self.device copyWithZone:zone];
        copy.app = [self.app copyWithZone:zone];
        copy.impression = [self.impression copyWithZone:zone];
        copy.testType = self.testType;
        copy.eventId = [self.eventId copyWithZone:zone];
        copy.sdk = [self.sdk copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
    }
    
    return copy;
}


@end

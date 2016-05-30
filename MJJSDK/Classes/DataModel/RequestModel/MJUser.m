//
//  MJUser.m
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MJUser.h"


NSString *const kMJUserAppUserId = @"app_user_id";
NSString *const kMJUserMac = @"mac";
NSString *const kMJUserImei = @"imei";
NSString *const kMJUserAndroidId = @"android_id";
NSString *const kMJUserOpenuuid = @"openuuid";
NSString *const kMJUserPhoneNumber = @"phone_number";
NSString *const kMJUserPasteBoard = @"paste_board";
NSString *const kMJUserIdfa = @"idfa";


@interface MJUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MJUser

@synthesize appUserId = _appUserId;
@synthesize mac = _mac;
@synthesize imei = _imei;
@synthesize androidId = _androidId;
@synthesize openuuid = _openuuid;
@synthesize phoneNumber = _phoneNumber;
@synthesize pasteBoard = _pasteBoard;
@synthesize idfa = _idfa;


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
            self.appUserId = [self objectOrNilForKey:kMJUserAppUserId fromDictionary:dict];
            self.mac = [self objectOrNilForKey:kMJUserMac fromDictionary:dict];
            self.imei = [self objectOrNilForKey:kMJUserImei fromDictionary:dict];
            self.androidId = [self objectOrNilForKey:kMJUserAndroidId fromDictionary:dict];
            self.openuuid = [self objectOrNilForKey:kMJUserOpenuuid fromDictionary:dict];
            self.phoneNumber = [self objectOrNilForKey:kMJUserPhoneNumber fromDictionary:dict];
            self.pasteBoard = [self objectOrNilForKey:kMJUserPasteBoard fromDictionary:dict];
            self.idfa = [self objectOrNilForKey:kMJUserIdfa fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.appUserId forKey:kMJUserAppUserId];
    [mutableDict setValue:self.mac forKey:kMJUserMac];
    [mutableDict setValue:self.imei forKey:kMJUserImei];
    [mutableDict setValue:self.androidId forKey:kMJUserAndroidId];
    [mutableDict setValue:self.openuuid forKey:kMJUserOpenuuid];
    [mutableDict setValue:self.phoneNumber forKey:kMJUserPhoneNumber];
    [mutableDict setValue:self.pasteBoard forKey:kMJUserPasteBoard];
    [mutableDict setValue:self.idfa forKey:kMJUserIdfa];

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

    self.appUserId = [aDecoder decodeObjectForKey:kMJUserAppUserId];
    self.mac = [aDecoder decodeObjectForKey:kMJUserMac];
    self.imei = [aDecoder decodeObjectForKey:kMJUserImei];
    self.androidId = [aDecoder decodeObjectForKey:kMJUserAndroidId];
    self.openuuid = [aDecoder decodeObjectForKey:kMJUserOpenuuid];
    self.phoneNumber = [aDecoder decodeObjectForKey:kMJUserPhoneNumber];
    self.pasteBoard = [aDecoder decodeObjectForKey:kMJUserPasteBoard];
    self.idfa = [aDecoder decodeObjectForKey:kMJUserIdfa];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_appUserId forKey:kMJUserAppUserId];
    [aCoder encodeObject:_mac forKey:kMJUserMac];
    [aCoder encodeObject:_imei forKey:kMJUserImei];
    [aCoder encodeObject:_androidId forKey:kMJUserAndroidId];
    [aCoder encodeObject:_openuuid forKey:kMJUserOpenuuid];
    [aCoder encodeObject:_phoneNumber forKey:kMJUserPhoneNumber];
    [aCoder encodeObject:_pasteBoard forKey:kMJUserPasteBoard];
    [aCoder encodeObject:_idfa forKey:kMJUserIdfa];
}

- (id)copyWithZone:(NSZone *)zone
{
    MJUser *copy = [[MJUser alloc] init];
    
    if (copy) {

        copy.appUserId = [self.appUserId copyWithZone:zone];
        copy.mac = [self.mac copyWithZone:zone];
        copy.imei = [self.imei copyWithZone:zone];
        copy.androidId = [self.androidId copyWithZone:zone];
        copy.openuuid = [self.openuuid copyWithZone:zone];
        copy.phoneNumber = [self.phoneNumber copyWithZone:zone];
        copy.pasteBoard = [self.pasteBoard copyWithZone:zone];
        copy.idfa = [self.idfa copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  MJDevice.m
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "MJDevice.h"
#import "MJGeo.h"


NSString *const kMJDeviceName = @"name";
NSString *const kMJDevicePixelWidth = @"pixel_width";
NSString *const kMJDeviceDeviceOrientation = @"device_orientation";
NSString *const kMJDevicePhysicalSize = @"physical_size";
NSString *const kMJDeviceIsJsEnabled = @"is_js_enabled";
NSString *const kMJDevicePixelHeight = @"pixel_height";
NSString *const kMJDeviceIsRooted = @"is_rooted";
NSString *const kMJDeviceBrand = @"brand";
NSString *const kMJDeviceIsFlashEnabled = @"is_flash_enabled";
NSString *const kMJDeviceOs = @"os";
NSString *const kMJDeviceDeviceType = @"device_type";
NSString *const kMJDevicePlatform = @"platform";
NSString *const kMJDeviceIp = @"ip";
NSString *const kMJDeviceGeo = @"geo";
NSString *const kMJDeviceNetworkConnectionType = @"network_connection_type";
NSString *const kMJDeviceUserAgent = @"user_agent";
NSString *const kMJDeviceModel = @"model";
NSString *const kMJDeviceOsVersion = @"os_version";
NSString *const kMJDeviceCarrierId = @"carrier_id";


@interface MJDevice ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MJDevice

@synthesize name = _name;
@synthesize pixelWidth = _pixelWidth;
@synthesize deviceOrientation = _deviceOrientation;
@synthesize physicalSize = _physicalSize;
@synthesize isJsEnabled = _isJsEnabled;
@synthesize pixelHeight = _pixelHeight;
@synthesize isRooted = _isRooted;
@synthesize brand = _brand;
@synthesize isFlashEnabled = _isFlashEnabled;
@synthesize os = _os;
@synthesize deviceType = _deviceType;
@synthesize platform = _platform;
@synthesize ip = _ip;
@synthesize geo = _geo;
@synthesize networkConnectionType = _networkConnectionType;
@synthesize userAgent = _userAgent;
@synthesize model = _model;
@synthesize osVersion = _osVersion;
@synthesize carrierId = _carrierId;


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
            self.name = [self objectOrNilForKey:kMJDeviceName fromDictionary:dict];
            self.pixelWidth = [[self objectOrNilForKey:kMJDevicePixelWidth fromDictionary:dict] doubleValue];
            self.deviceOrientation = [[self objectOrNilForKey:kMJDeviceDeviceOrientation fromDictionary:dict] doubleValue];
            self.physicalSize = [self objectOrNilForKey:kMJDevicePhysicalSize fromDictionary:dict];
            self.isJsEnabled = [self objectOrNilForKey:kMJDeviceIsJsEnabled fromDictionary:dict];
            self.pixelHeight = [[self objectOrNilForKey:kMJDevicePixelHeight fromDictionary:dict] doubleValue];
            self.isRooted = [self objectOrNilForKey:kMJDeviceIsRooted fromDictionary:dict];
            self.brand = [self objectOrNilForKey:kMJDeviceBrand fromDictionary:dict];
            self.isFlashEnabled = [self objectOrNilForKey:kMJDeviceIsFlashEnabled fromDictionary:dict];
            self.os = [self objectOrNilForKey:kMJDeviceOs fromDictionary:dict];
            self.deviceType = [[self objectOrNilForKey:kMJDeviceDeviceType fromDictionary:dict] doubleValue];
            self.platform = [[self objectOrNilForKey:kMJDevicePlatform fromDictionary:dict] doubleValue];
            self.ip = [self objectOrNilForKey:kMJDeviceIp fromDictionary:dict];
            self.geo = [MJGeo modelObjectWithDictionary:[dict objectForKey:kMJDeviceGeo]];
            self.networkConnectionType = [[self objectOrNilForKey:kMJDeviceNetworkConnectionType fromDictionary:dict] doubleValue];
            self.userAgent = [self objectOrNilForKey:kMJDeviceUserAgent fromDictionary:dict];
            self.model = [self objectOrNilForKey:kMJDeviceModel fromDictionary:dict];
            self.osVersion = [self objectOrNilForKey:kMJDeviceOsVersion fromDictionary:dict];
            self.carrierId = [self objectOrNilForKey:kMJDeviceCarrierId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kMJDeviceName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pixelWidth] forKey:kMJDevicePixelWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.deviceOrientation] forKey:kMJDeviceDeviceOrientation];
    [mutableDict setValue:self.physicalSize forKey:kMJDevicePhysicalSize];
    [mutableDict setValue:self.isJsEnabled forKey:kMJDeviceIsJsEnabled];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pixelHeight] forKey:kMJDevicePixelHeight];
    [mutableDict setValue:self.isRooted forKey:kMJDeviceIsRooted];
    [mutableDict setValue:self.brand forKey:kMJDeviceBrand];
    [mutableDict setValue:self.isFlashEnabled forKey:kMJDeviceIsFlashEnabled];
    [mutableDict setValue:self.os forKey:kMJDeviceOs];
    [mutableDict setValue:[NSNumber numberWithDouble:self.deviceType] forKey:kMJDeviceDeviceType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.platform] forKey:kMJDevicePlatform];
    [mutableDict setValue:self.ip forKey:kMJDeviceIp];
    [mutableDict setValue:[self.geo dictionaryRepresentation] forKey:kMJDeviceGeo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.networkConnectionType] forKey:kMJDeviceNetworkConnectionType];
    [mutableDict setValue:self.userAgent forKey:kMJDeviceUserAgent];
    [mutableDict setValue:self.model forKey:kMJDeviceModel];
    [mutableDict setValue:self.osVersion forKey:kMJDeviceOsVersion];
    [mutableDict setValue:self.carrierId forKey:kMJDeviceCarrierId];

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

    self.name = [aDecoder decodeObjectForKey:kMJDeviceName];
    self.pixelWidth = [aDecoder decodeDoubleForKey:kMJDevicePixelWidth];
    self.deviceOrientation = [aDecoder decodeDoubleForKey:kMJDeviceDeviceOrientation];
    self.physicalSize = [aDecoder decodeObjectForKey:kMJDevicePhysicalSize];
    self.isJsEnabled = [aDecoder decodeObjectForKey:kMJDeviceIsJsEnabled];
    self.pixelHeight = [aDecoder decodeDoubleForKey:kMJDevicePixelHeight];
    self.isRooted = [aDecoder decodeObjectForKey:kMJDeviceIsRooted];
    self.brand = [aDecoder decodeObjectForKey:kMJDeviceBrand];
    self.isFlashEnabled = [aDecoder decodeObjectForKey:kMJDeviceIsFlashEnabled];
    self.os = [aDecoder decodeObjectForKey:kMJDeviceOs];
    self.deviceType = [aDecoder decodeDoubleForKey:kMJDeviceDeviceType];
    self.platform = [aDecoder decodeDoubleForKey:kMJDevicePlatform];
    self.ip = [aDecoder decodeObjectForKey:kMJDeviceIp];
    self.geo = [aDecoder decodeObjectForKey:kMJDeviceGeo];
    self.networkConnectionType = [aDecoder decodeDoubleForKey:kMJDeviceNetworkConnectionType];
    self.userAgent = [aDecoder decodeObjectForKey:kMJDeviceUserAgent];
    self.model = [aDecoder decodeObjectForKey:kMJDeviceModel];
    self.osVersion = [aDecoder decodeObjectForKey:kMJDeviceOsVersion];
    self.carrierId = [aDecoder decodeObjectForKey:kMJDeviceCarrierId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kMJDeviceName];
    [aCoder encodeDouble:_pixelWidth forKey:kMJDevicePixelWidth];
    [aCoder encodeDouble:_deviceOrientation forKey:kMJDeviceDeviceOrientation];
    [aCoder encodeObject:_physicalSize forKey:kMJDevicePhysicalSize];
    [aCoder encodeObject:_isJsEnabled forKey:kMJDeviceIsJsEnabled];
    [aCoder encodeDouble:_pixelHeight forKey:kMJDevicePixelHeight];
    [aCoder encodeObject:_isRooted forKey:kMJDeviceIsRooted];
    [aCoder encodeObject:_brand forKey:kMJDeviceBrand];
    [aCoder encodeObject:_isFlashEnabled forKey:kMJDeviceIsFlashEnabled];
    [aCoder encodeObject:_os forKey:kMJDeviceOs];
    [aCoder encodeDouble:_deviceType forKey:kMJDeviceDeviceType];
    [aCoder encodeDouble:_platform forKey:kMJDevicePlatform];
    [aCoder encodeObject:_ip forKey:kMJDeviceIp];
    [aCoder encodeObject:_geo forKey:kMJDeviceGeo];
    [aCoder encodeDouble:_networkConnectionType forKey:kMJDeviceNetworkConnectionType];
    [aCoder encodeObject:_userAgent forKey:kMJDeviceUserAgent];
    [aCoder encodeObject:_model forKey:kMJDeviceModel];
    [aCoder encodeObject:_osVersion forKey:kMJDeviceOsVersion];
    [aCoder encodeObject:_carrierId forKey:kMJDeviceCarrierId];
}

- (id)copyWithZone:(NSZone *)zone
{
    MJDevice *copy = [[MJDevice alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.pixelWidth = self.pixelWidth;
        copy.deviceOrientation = self.deviceOrientation;
        copy.physicalSize = [self.physicalSize copyWithZone:zone];
        copy.isJsEnabled = [self.isJsEnabled copyWithZone:zone];
        copy.pixelHeight = self.pixelHeight;
        copy.isRooted = [self.isRooted copyWithZone:zone];
        copy.brand = [self.brand copyWithZone:zone];
        copy.isFlashEnabled = [self.isFlashEnabled copyWithZone:zone];
        copy.os = [self.os copyWithZone:zone];
        copy.deviceType = self.deviceType;
        copy.platform = self.platform;
        copy.ip = [self.ip copyWithZone:zone];
        copy.geo = [self.geo copyWithZone:zone];
        copy.networkConnectionType = self.networkConnectionType;
        copy.userAgent = [self.userAgent copyWithZone:zone];
        copy.model = [self.model copyWithZone:zone];
        copy.osVersion = [self.osVersion copyWithZone:zone];
        copy.carrierId = [self.carrierId copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  MJResponseModel.h
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MJImpAds;

@interface MJResponseModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *eventId;
@property (nonatomic, strong) MJImpAds *impAds;
@property (nonatomic, strong) NSString *myProperty1;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

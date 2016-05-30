//
//  MJUser.h
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MJUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *appUserId;
@property (nonatomic, strong) NSString *mac;
@property (nonatomic, strong) NSString *imei;
@property (nonatomic, strong) NSString *androidId;
@property (nonatomic, strong) NSString *openuuid;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *pasteBoard;
@property (nonatomic, strong) NSString *idfa;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

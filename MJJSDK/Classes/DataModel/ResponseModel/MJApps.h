//
//  MJApps.h
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MJApps : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *appNam;
@property (nonatomic, strong) NSString *btnUrl;
@property (nonatomic, strong) NSString *clickUrl;
@property (nonatomic, assign) double productType;
@property (nonatomic, strong) NSString *logoUrl;
@property (nonatomic, strong) NSString *appDescription;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

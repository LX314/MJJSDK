//
//  MJBannerAds.h
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MJBannerAds : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *appName;
@property (nonatomic, strong) NSString *clickUrl;
@property (nonatomic, strong) NSString *btnUrl;
@property (nonatomic, strong) NSString *appDescription;
@property (nonatomic, strong) NSString *logoUrl;
@property (nonatomic, strong) NSString *imgUrl;
@property (nonatomic, strong) NSString *httpSnippet;
@property (nonatomic, assign) double productType;
@property (nonatomic, assign) double type;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  MJImpression.h
//
//  Created by FairyLand  on 16/5/30
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MJImpression : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *impId;
@property (nonatomic, strong) NSString *adspaceId;
@property (nonatomic, strong) NSString *adCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

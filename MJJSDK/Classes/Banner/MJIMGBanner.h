//
//  MJBanner.h
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/13.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJBaseBanner.h"

@interface MJIMGBanner : MJBaseBanner

{
    
}
/** test use. */
//@property (nonatomic,retain,readonly)SDCycleScrollView *mjBanner;
/** <#注释#>*/
//@property (nonatomic,assign)KMJBannerPosition mjBannerPosition;
@property (nonatomic,assign)CGFloat mjBannerTop;

@property (nonatomic,retain)UIImageView *imgView_banner;
+ (instancetype)sharedInstance;

- (void)fill:(NSDictionary *)params;

@end

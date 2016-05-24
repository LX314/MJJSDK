//
//  MJBaseBanner.h
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/19.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJView.h"
#import "SDCycleScrollView.h"

@interface MJBaseBanner : MJView
{
    
}

/** <#注释#>*/
@property (nonatomic,retain)SDCycleScrollView *mjBanner;
/** <#注释#>*/
@property (nonatomic,assign)KMJBannerPosition mjBannerPosition;
- (void)showNext;

- (void)setUp;
- (void)masonry;

+ (void)setupTimer;
+ (void)invalidateTimer;

@end

//
//  MJBaseBanner.h
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/19.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJView.h"
#import <UIKit/UIKit.h>

//#import "SDCycleScrollView.h"

@interface MJBaseBanner : UITableViewCell
{
    
}
/** <#注释#>*/
//@property (nonatomic,retain)SDCycleScrollView *mjBanner;
/** <#注释#>*/
//@property (nonatomic,assign)KMJBannerPosition mjBannerPosition;
/** <#注释#>*/
@property (nonatomic,retain)UIButton *btnClose;
/** <#注释#>*/
@property (nonatomic,retain)UILabel *mjLabADLogo;


- (void)showNext;

- (void)setUp;
- (void)masonry;

+ (void)setupTimer;
+ (void)invalidateTimer;

- (void)fill:(NSDictionary *)params;

- (void)registerNotifications;
- (void)mjreset;

@end

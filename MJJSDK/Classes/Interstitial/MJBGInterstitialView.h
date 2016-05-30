//
//  MJBGInterstitialView.h
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/20.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJView.h"

#import "MJSDKConfiguration.h"

@interface MJBGInterstitialView : MJView
{
    
}
/** <#注释#>*/
@property (nonatomic,assign)KMJInterstitialType mjInterstitialType;
/** <#注释#>*/
@property (nonatomic,assign)KMJInterstitialStyle mjInterstitialStyle;
@property (assign, nonatomic) LXMJViewMaskType defaultMaskType;
/** <#注释#>*/
@property (nonatomic,retain)UIColor *bgLayerColor;
+ (instancetype)sharedInstance;
- (void)show;
+ (void)show;


@end

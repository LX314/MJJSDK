//
//  MJInterstitial.h
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/13.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJBaseInterstitial.h"
@class MJInterstitial;

@protocol MJInterstitialDelegate <NSObject>

/**
 *  @brief 显示插屏广告
 *
 *  @param InterstitialView 插屏广告对象
 *  @param error             若发生错误,则error
 */
- (void)mjShowInterstitialView:(MJInterstitial *)mjInterstitial error:(MJError *)error;
/**
 *  @brief 点击插屏广告时的回调
 *
 *  @param InterstitialView 插屏广告对象
 */
- (void)mjClickInterstitialView:(MJInterstitial *)mjInterstitial;
/**
 *  @brief 关闭插屏广告时的回调
 *
 *  @param InterstitialView 插屏广告对象
 */
- (void)mjCloseInterstitialView:(MJInterstitial *)mjInterstitial;

@end

@interface MJInterstitial : MJBaseInterstitial
{
    
}
/** delegate*/
@property (nonatomic,assign)id<MJInterstitialDelegate> delegate;
/** <#注释#>*/
@property (nonatomic,assign)KMJInterstitialType interstitialViewType;

+ (instancetype)sharedInstance;

- (void)show;
//- (void)showCloseIco:(id)sender;

@end

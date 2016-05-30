//
//  MJSDKConfiguration.h
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/20.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#ifndef MJSDKConfiguration_h
#define MJSDKConfiguration_h


/***************_Base_***************/
#define kMJSDKDidClosedNotification @"kMJSDKDidClosedNotification"

typedef NS_ENUM(NSUInteger, LXMJViewMaskType) {
    LXMJViewMaskTypeNone = 1,
    LXMJViewMaskTypeClear,
    LXMJViewMaskTypeBlack,
    LXMJViewMaskTypeGradient,
    LXMJViewMaskTypeCustom
};

#pragma mark - mjSuperiew
static UIWindow *mjSuperiew()
{
    id mjSuperView;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    mjSuperView = keyWindow;
    [keyWindow setWindowLevel:UIWindowLevelAlert];
    return mjSuperView;
}
/***************_Banner_***************/
#define kADBannerHeight 59.f



typedef NS_ENUM(NSInteger, KMJBannerPosition) {
    KMJBannerPositionTop = 0,
    KMJBannerPositionBottom = 1,
    KMJBannerPositionLeft = 2,
    KMJBannerPositionRight = 3,
    KMJBannerPositionCenter = 4,
    KMJBannerPositionCustom = 5
};
/***************_Interstitial_***************/
#define kMJInterstitialFullScreenBounds kMainScreen
#define kMJInterstitialHalfScreenBounds CGRectMake(0, 0, 300.f, 250.f)


typedef NS_ENUM(NSInteger, KMJInterstitialType) {
    KMJInterstitialTypeHalfScreen = 0,//default
    KMJInterstitialTypeFullScreen = 1,
    KMJInterstitialTypeNone = 3
};


typedef NS_ENUM(NSInteger, KMJInterstitialStyle) {
    KMJInterstitialNoneStyle = 0,
    KMJInterstitialIMGStyle = 1,
    KMJInterstitialGLStyle = 2,
    KMJInterstitialMDStyle = 3
};
/***************__***************/
/***************__***************/
/***************__***************/
/***************__***************/
/***************__***************/
/***************__***************/
/***************__***************/
/***************__***************/
/***************__***************/



#endif /* MJSDKConfiguration_h */

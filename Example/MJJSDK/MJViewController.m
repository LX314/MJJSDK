//
//  MJViewController.m
//  MJJSDK
//
//  Created by LX314 on 05/23/2016.
//  Copyright (c) 2016 LX314. All rights reserved.
//

#import "MJViewController.h"


//
//  ViewController.m
//  sdk-ADView
//
//  Created by John LXThyme on 4/22/16.
//  Copyright © 2016 John LXThyme. All rights reserved.
//


//#import "TransitionDelegate.h"

#import "MJIMGBanner.h"
#import "MJGLBanner.h"

#import "MJInterstitial.h"
#import "MJBGInterstitialView.h"
#import "MJIMGInterstitial.h"
#import "MJGLInterstitial.h"

#import "MJLAAppsVC.h"

//#import <MBProgressHUD.h>
//#import <SVProgressHUD.h>
#import "POP.h"

#import <AdSupport/ASIdentifierManager.h>

//#import "MJInterstitialVC.h"
#import "ListVC.h"

@interface MJViewController ()<MJInterstitialDelegate>
{
    
}


- (IBAction)btnShowAlertADView:(id)sender;

@end

@implementation MJViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    //    [MJBannerView setupTimer];
    [MJIMGBanner setupTimer];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    
    //    [MJBannerView invalidateTimer];
    [MJIMGBanner setupTimer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //
    self.title = @"首页";
    [self initView];
    //
    //    NSArray *fonts = [UIFont familyNames];
    //    NSLog(@"Fonts:%@",fonts);
    //
    //    [self initial];
}
- (void)initView{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    MJIMGBanner *mjBanner = [MJIMGBanner sharedInstance];
    [mjBanner setMjBannerPosition:KMJBannerPositionTop];
    [self.view addSubview:mjBanner];
    
    MJGLBanner *glBanner = [MJGLBanner sharedInstance];
    [glBanner setMjBannerPosition:KMJBannerPositionBottom];
    [self.view addSubview:glBanner];
    
    return;
    //dispatch_after
    double delayInSeconds = 10;
    dispatch_time_t delayInNanoSeconds = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(delayInNanoSeconds, dispatch_get_global_queue(0, 0), ^{
        //Your code here...
        dispatch_async(dispatch_get_main_queue(), ^{
            //
            [mjBanner.mjBanner setImageURLStringsGroup:@[
                                                         @"https://raw.githubusercontent.com/gsdios/SDCycleScrollView/master/SDCycleScrollView/h2.jpg",
                                                         @"https://raw.githubusercontent.com/gsdios/SDCycleScrollView/master/SDCycleScrollView/h3.jpg",
                                                         @"https://raw.githubusercontent.com/gsdios/SDCycleScrollView/master/SDCycleScrollView/h4.jpg",
                                                         @"https://raw.githubusercontent.com/gsdios/SDCycleScrollView/master/SDCycleScrollView/h5.jpg"
                                                         ]];
            [mjBanner.mjBanner setTitlesGroup:@[
                                                @"Second",
                                                @"Third",
                                                @"Forth",
                                                @"Fifth"
                                                ]];
        });
        
    });
    
}


- (void)initial
{
    /**
     *初始化相关配置
     *
     */
    UIDevice *device = [UIDevice currentDevice];
    NSDictionary *dict_device = @{
                                  @"name":device.name,// e.g. "My iPhone"
                                  @"model":device.model,// e.g. @"iPhone", @"iPod touch"
                                  @"localizedModel":device.localizedModel,// localized version of model
                                  @"systemName":device.systemName,// e.g. @"iOS"
                                  @"systemVersion":device.systemVersion,// e.g. @"4.0"
                                  @"orientation":@(device.orientation),// return current device orientation.  this will return UIDeviceOrientationUnknown unless device orientation notifications are being generated.
                                  //          @"identifierForVendor":device.identifierForVendor.UUIDString,//NS_AVAILABLE_IOS(6_0) a UUID that may be used to uniquely identify the device, same across apps from a single vendor
                                  @"generatesDeviceOrientationNotifications":@(device.generatesDeviceOrientationNotifications),
                                  //          @"batteryMonitoringEnabled":@(device.batteryMonitoringEnabled),//NS_AVAILABLE_IOS(3_0)
                                  //          @"batteryState":@(device.batteryState),//NS_AVAILABLE_IOS(3_0)
                                  //          @"batteryLevel":@(device.batteryLevel),//NS_AVAILABLE_IOS(3_0)
                                  //          @"proximityMonitoringEnabled":@(device.proximityMonitoringEnabled),//NS_AVAILABLE_IOS(3_0)
                                  //          @"proximityState":@(device.proximityState),//NS_AVAILABLE_IOS(3_0)
                                  //          @"multitaskingSupported":@(device.multitaskingSupported),//NS_AVAILABLE_IOS(4_0)
                                  //          @"userInterfaceIdiom":@(device.userInterfaceIdiom)//NS_AVAILABLE_IOS(3_2)
                                  };
    NSLog(@"Device:%@",dict_device);
}


- (IBAction)btnShowAlertADView:(id)sender {
    //    NSLog(@"TAG:%ld",(long)[sender tag]);
    switch ([sender tag])
    {
        case 111://Interstitial
        {
            //            MJInterstitial *mjIntersitial = [MJInterstitial sharedInstance];
            //            mjIntersitial.delegate = self;
            //            mjIntersitial.interstitialViewType =
            //            //                                                        KMJInterstitialViewFullScreenType;
            //            KMJInterstitialHalfScreenType;
            //            [mjIntersitial show];
            //            MJIMGInterstitial *imgInterstitial = [MJIMGInterstitial sharedInstance];
            //            [imgInterstitial setCenter:self.view.center];
            //            [self.view addSubview:imgInterstitial];
            MJBGInterstitialView *mj = [MJBGInterstitialView sharedInstance];
            mj.defaultMaskType = LXMJViewMaskTypeGradient;
            mj.mjInterstitialType = KMJInterstitialTypeFullScreen;
            mj.mjInterstitialStyle = KMJInterstitialIMGStyle;
            [MJBGInterstitialView show];
            [MJBGInterstitialView show];
            break;
        }
        case 222://插屏
        {
            //            MJInterstitial *mjIntersitial = [MJInterstitial sharedInstance];
            //            mjIntersitial.delegate = self;
            //            mjIntersitial.interstitialViewType =
            //                                                        KMJInterstitialFullScreenType;
            ////                                                     KMJInterstitialHalfScreenType;
            //            [mjIntersitial show];
            //            MJIMGInterstitial *imgInterstitial = [MJIMGInterstitial sharedInstance];
            //            [self.view addSubview:imgInterstitial];
            
            //            MJBGInterstitialView *mj = [MJBGInterstitialView sharedInstance];
            //            mj.defaultMaskType = LXMJViewMaskTypeGradient;
            //            mj.mjInterstitialType =
            //                                                KMJInterstitialTypeHalfScreen;
            ////                                                KMJInterstitialTypeFullScreen;
            //            mj.mjInterstitialStyle = KMJInterstitialIMGStyle;
            //            [MJBGInterstitialView show];
            
            MJBGInterstitialView *mj = [MJBGInterstitialView sharedInstance];
            mj.defaultMaskType = LXMJViewMaskTypeGradient;
            mj.mjInterstitialType =
            KMJInterstitialTypeHalfScreen;
            //                                                KMJInterstitialTypeFullScreen;
            mj.mjInterstitialStyle =
            //                                                                KMJInterstitialIMGStyle;
            KMJInterstitialGLStyle;
            [MJBGInterstitialView show];
            break;
        }
        case 333:// NEXT
        {
            ListVC *listVC = [[ListVC alloc]init];
            [self.navigationController pushViewController:listVC animated:YES];
            break;
        }
        case 444:{//IMG Show
            MJIMGBanner *mjBanner = [MJIMGBanner sharedInstance];
            [self.view addSubview:mjBanner];
            break;
        }
        case 555:{//IMG Next
            MJIMGBanner *mjBanner = [MJIMGBanner sharedInstance];
            [mjBanner showNext];
            break;
        }
        case 666:{//GL SHOW
            MJGLBanner *glBanner = [MJGLBanner sharedInstance];
            [self.view addSubview:glBanner];
            break;
        }
        case 777:{//GL NEXT
            
            break;
        }
        case 888:{//应用墙(A)
            MJLAAppsVC *la = [[MJLAAppsVC alloc]init];
            //            [self presentViewController:la animated:YES completion:nil];
            [la show];
            break;
        }
        case 999:{//应用墙(B)
            break;
        }
        default:
        {
            NSAssert(NO, @"发生错误!");
            break;
        }
    }//switch
}

#pragma mark -
#pragma mark - 插屏广告代理 - MJInterstitialDelegate
/**
 *  @brief 显示插屏广告失败时的回调
 *
 *  @param InterstitialView 插屏广告对象
 *  @param error             error
 */
- (void)mjShowInterstitialView:(MJInterstitial *)mjInterstitial error:(MJError *)error{
    if (!error) {
        NSLog(@"显示插屏广告");
    } else {
        NSLog(@"显示插屏广告时发生错误!");
    }
}
/**
 *  @brief 点击插屏广告时的回调
 *
 *  @param InterstitialView 插屏广告对象
 */
- (void)mjClickInterstitialView:(MJInterstitial *)mjInterstitial{
    NSLog(@"点击了插屏广告");
}
/**
 *  @brief 关闭插屏广告时的回调
 *
 *  @param InterstitialView 插屏广告对象
 */
- (void)mjCloseInterstitialView:(MJInterstitial *)mjInterstitial{
    NSLog(@"关闭插屏广告");
}

- (void)dealloc{
    NSLog(@"dealloc");
}
@end


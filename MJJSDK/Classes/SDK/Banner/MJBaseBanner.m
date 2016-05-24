//
//  MJBaseBanner.m
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/19.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJBaseBanner.h"
@interface MJBaseBanner ()<SDCycleScrollViewDelegate>
{
    
}

@end


@implementation MJBaseBanner
- (instancetype)init{
    if (self = [super init]) {
        //
    }
    return self;
}
- (void)setUp{
    [self addSubview:self.btnClose];
    [self addSubview:self.mjLabADLogo];
}
- (void)masonry{
    UIView *superView = self;
    [self.btnClose mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.top.equalTo(superView).offset(5);
        make.right.equalTo(superView).offset(-5);
        make.size.mas_equalTo(CGSizeMake(15, 15));
    }];
    [self.mjLabADLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.left.equalTo(superView).offset(2.f);
        make.bottom.equalTo(superView).offset(-2.f);
    }];
}
- (void)mjreset
{
    [super mjreset];
    //
    //    [self setFrame:CGRectMake(0, 65, kMainScreen_width, kADBannerHeight)];
    //    [self masonry];
//    [self updateInterstitialFrame];
    [self updateMJBannerFrame];
}
//- (void)updateInterstitialFrame{
//    [self setFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)];
//    [self updateMask];
//}
- (void)showNext{
    CGRect currentFrame = self.frame;
    CGFloat currenyX = CGRectGetMidX(self.frame);
//    __block CGRect from = currentFrame;
//    __block CGRect to;
    __block CGFloat from;
    __block CGFloat to;
    
    from = currenyX;
    to += CGRectGetWidth(currentFrame) + currenyX + 100;
    
    [self animation:from to:to completion:^{
        //
        from -= CGRectGetWidth(currentFrame) + currenyX + 100;
        to = currenyX;
        [self animation:from to:to completion:^{
            //
//            [self removeFromSuperview];
        }];
    }];
}
- (void)animation:(CGFloat)from to:(CGFloat)to completion:(void(^)())block{
    id view_t = (MJBaseBanner *)self;
    POPSpringAnimation *animDismiss = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    animDismiss.springBounciness = 5;
    animDismiss.springSpeed = 10;
    animDismiss.fromValue = @(from);
    animDismiss.toValue = @(to);
    [view_t pop_addAnimation:animDismiss forKey:@"size"];
    [animDismiss setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
        //
        if (block) {
            block();
        }
    }];
}
- (void)updateMJBannerFrame{
    CGRect statusBarFrame = [[UIApplication sharedApplication]statusBarFrame];
    UIViewController *rootVC = [[[UIApplication sharedApplication]keyWindow]rootViewController];
    CGRect navbarFrame = CGRectZero,
    tabbarFrame = CGRectZero;
    if ([rootVC isKindOfClass:[UINavigationController class]]) {
        UINavigationController *nav  = (UINavigationController *)rootVC;
        navbarFrame = nav.navigationBar.frame;
    } else if([rootVC isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabbar = (UITabBarController *)rootVC;
        tabbarFrame = tabbar.tabBar.frame;
    }
//    NSLog(@"\n\
//          status:%@\n\
//          nav:%@\n\
//          tabbar:%@",
//          NSStringFromCGRect(statusBarFrame),
//          NSStringFromCGRect(navbarFrame),
//          NSStringFromCGRect(tabbarFrame))
    CGFloat bannerTop;
    if (self.mjBannerPosition == KMJBannerPositionTop) {
        bannerTop = CGRectGetHeight(statusBarFrame) + CGRectGetHeight(navbarFrame) + CGRectGetHeight(tabbarFrame);
    } else if (self.mjBannerPosition == KMJBannerPositionBottom) {
        bannerTop = kMainScreen_height - CGRectGetHeight(tabbarFrame) - kADBannerHeight;
    } else {
        NSAssert(NO, @"目前不支持该类型!");
    }
    CGRect bannerFrame = CGRectMake(0,
                                    bannerTop,
                                    CGRectGetWidth(kMainScreen),
                                    kADBannerHeight);
    [self setFrame:bannerFrame];
//    [__sharedInstance.mjBanner setFrame:CGRectMake(0, 0, CGRectGetWidth(bannerFrame), CGRectGetHeight(bannerFrame))];
}
//- (void)registerNotifications {
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(mjreset:)
//                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
//                                               object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(mjreset:)
//                                                 name:UIApplicationDidChangeStatusBarFrameNotification
//                                               object:nil];
//}
//- (void)mjreset:(NSNotification *)notification{
//    [self mjreset];
//}
//- (void)mjreset{
//    
//}
#pragma mark -
#pragma mark -  /***************__***************/

+ (void)setupTimer{
    
}
+ (void)invalidateTimer{
    
}
- (void)setupTimer{
//    [self.mjBannerView setupTimer];
}
- (void)invalidateTimer{
//    [[[MJBaseBanner sharedInstance]mjBanner]invalidateTimer];
}
//#pragma mark - btnClose
//- (UIButton *)btnClose
//{
//    if(!_btnClose){
//        
//        //初始化一个 Button
//        _btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_btnClose setFrame:CGRectZero];
//        //        [<#btn#> setBackgroundColor:[UIColor <#color#>]];
//        
//        
//        //背景图片
//        //        [_btnClose setBackgroundImage:[UIImage imageNamed:@"横幅关闭按钮1"] forState:UIControlStateNormal];
//        [_btnClose setTitle:@"✕" forState:UIControlStateNormal];
//        [_btnClose setTitleColor:[UIColor colorFromHexString:@"#cccccc"] forState:UIControlStateNormal];
//        [_btnClose.titleLabel setFont:[UIFont systemFontOfSize:12.f]];
//        //绑定事件
//        [_btnClose addTarget:self action:@selector(btnCloseClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_btnClose setTag:123456];
//        
//        
//    }
//    
//    return _btnClose;
//}
//- (void)btnCloseClick:(id)sender
//{
////    UIButton *btn = (UIButton *)sender;
//    //
//    [self removeFromSuperview];
//}

#pragma mark - mjBanner
- (SDCycleScrollView *)mjBanner
{
    if(!_mjBanner){
        _mjBanner = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 20, kMainScreen_width, kMainScreen_height) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
        //数据源
        //        [_mjBanner setImageURLStringsGroup:@[
        //                                             @"https://raw.githubusercontent.com/gsdios/SDCycleScrollView/master/SDCycleScrollView/h1.jpg",
        //                                             @"https://raw.githubusercontent.com/gsdios/SDCycleScrollView/master/SDCycleScrollView/h1.jpg",
        //                                             @"https://raw.githubusercontent.com/gsdios/SDCycleScrollView/master/SDCycleScrollView/h1.jpg",
        //                                             @"https://raw.githubusercontent.com/gsdios/SDCycleScrollView/master/SDCycleScrollView/h1.jpg"
        //                                             ]];
        [_mjBanner setLocalizationImageNamesGroup:@[
                                                    @"横幅banner样式.jpg"
                                                    ]];
        //        [_mjBanner setLocalizationImageNamesGroup:@[]];
        //        [_mjBanner setTitlesGroup:@[
        //                                    @"First",
        //                                    @"First",
        //                                    @"First",
        //                                    @"First"
        //                                    ]];
        
        //滚动控制
        [_mjBanner setAutoScrollTimeInterval:0.f];
        [_mjBanner setInfiniteLoop:NO];
        [_mjBanner setAutoScroll:NO];
        [_mjBanner setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        [_mjBanner setClickItemOperationBlock:^(NSInteger index) {
            //
        }];
        [_mjBanner setItemDidScrollOperationBlock:^(NSInteger index) {
            //
        }];
        
        //自定义样式
        //        [_mjBanner setBannerImageViewContentMode:UIViewContentModeScaleAspectFit];
        [_mjBanner setPlaceholderImage:[UIImage imageNamed:@"横幅banner样式"]];
        [_mjBanner setShowPageControl:NO];
        [_mjBanner setHidesForSinglePage:YES];
        [_mjBanner setPageControlStyle:SDCycleScrollViewPageContolStyleAnimated];
        [_mjBanner setPageControlAliment:SDCycleScrollViewPageContolAlimentRight];
        [_mjBanner setPageControlDotSize:CGSizeMake(15.f, 15.f)];
        
        //        [_mjBanner setCurrentPageDotColor:[UIColor yellowColor]];
        //        [_mjBanner setPageDotColor:[UIColor purpleColor]];
        
        //        [_mjBanner setCurrentPageDotImage:[UIImage imageNamed:@"单选 选中"]];
        //        [_mjBanner setPageDotImage:[UIImage imageNamed:@"单选 未选中"]];
        //
        //        [_mjBanner setTitleLabelTextColor:[UIColor magentaColor]];
        //        [_mjBanner setTitleLabelTextFont:[UIFont fontWithName:@"Comic Sans MS" size:14.f]];
        //        [_mjBanner setTitleLabelBackgroundColor:[UIColor colorWithRed:(40/255.0f) green:(40/255.0f) blue:(40/255.0f) alpha:1.0f]];
        //        [_mjBanner setTitleLabelHeight:25.f];
        
        //清除缓存
    }
    
    return _mjBanner;
}
@end

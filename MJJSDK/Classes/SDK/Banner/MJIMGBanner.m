//
//  MJBanner.m
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/13.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJIMGBanner.h"

@interface MJIMGBanner ()
{
    
}
/** <#注释#>*/
//@property (nonatomic,retain)UIImageView *imgView_banner;
@end

static MJIMGBanner *__sharedInstance = nil;

@implementation MJIMGBanner

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[[self class] alloc]init];
        [__sharedInstance setUp];
    });
    
    return __sharedInstance;
}
- (void)setUp{
//    [self addSubview:self.mjBanner];
//    [self.mjBanner addSubview:self.btnClose];
//    [self.mjBanner addSubview:self.mjLabADLogo];
//    [self setNeedsUpdateConstraints];
//    [self setNeedsLayout];
//    [self registerNotifications];
    [self setFrame:CGRectMake(0, 65, kMainScreen_width, kADBannerHeight)];
    [self addSubview:self.imgView_banner];
    [super setUp];
//    [self addSubview:self.btnClose];
//    [self addSubview:self.mjLabADLogo];
    //
    [self setNeedsUpdateConstraints];
    [self setNeedsLayout];
    //
    [self registerNotifications];
}
#pragma mark -
#pragma mark - Masonry Methods
- (void)updateConstraints{
    [super updateConstraints];
    //
    [self masonry];
}
- (void)mjreset
{
    [super mjreset];
    //
    [self setFrame:CGRectMake(0, 65, kMainScreen_width, kADBannerHeight)];
    [self masonry];
}
- (void)masonry
{//
    [super masonry];
    UIView *superView = self;
    //
//    [self.mjBannerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        //
//        make.edges.equalTo(superView);
//    }];
    [self.imgView_banner mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.edges.equalTo(superView);
    }];
//    [self.btnClose mas_makeConstraints:^(MASConstraintMaker *make) {
//        //
//        make.top.equalTo(superView).offset(5);
//        make.right.equalTo(superView).offset(-5);
//        make.size.mas_equalTo(CGSizeMake(15, 15));
//    }];
//    [self.mjLabADLogo mas_makeConstraints:^(MASConstraintMaker *make) {
//        //
//        make.left.equalTo(superView).offset(2.f);
//        make.bottom.equalTo(superView).offset(-2.f);
//    }];
}

#pragma mark - imgView_banner
- (UIImageView *)imgView_banner
{
    if(!_imgView_banner){
        _imgView_banner = [[UIImageView alloc]init];
        [_imgView_banner setBackgroundColor:[UIColor greenColor]];
        [_imgView_banner setImage:[UIImage imageNamed:@"横幅banner样式"]];
        
    }
    
    return _imgView_banner;
}


#pragma mark -
#pragma mark - /***************__***************/
//#pragma mark -
//#pragma mark - SDCycleScrollViewDelegate
///** 点击图片回调 */
//- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
//    NSLog(@"clicked:%ld",(long)index);
//}
///** 图片滚动回调 */
//- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
//    NSLog(@"scroll to:%ld",(long)index);
//}
//
//
////- (void)willMoveToSuperview:(nullable UIView *)newSuperview
////{
////    [self.mjBanner setFrame:self.bounds];
////}
//
//
//
//#pragma mark -
//#pragma mark - 适配
//#pragma mark -
//#pragma mark - Masonry Methods
//- (void)willMoveToSuperview:(UIView *)newSuperview{
//    [self setMJBannerFrame];
//}
//- (void)setMJBannerFrame{
//    CGRect statusBarFrame = [[UIApplication sharedApplication]statusBarFrame];
//    UIViewController *rootVC = [[[UIApplication sharedApplication]keyWindow]rootViewController];
//    CGRect navbarFrame = CGRectZero,
//    tabbarFrame = CGRectZero;
//    if ([rootVC isKindOfClass:[UINavigationController class]]) {
//        UINavigationController *nav  = (UINavigationController *)rootVC;
//        navbarFrame = nav.navigationBar.frame;
//    } else if([rootVC isKindOfClass:[UITabBarController class]]) {
//        UITabBarController *tabbar = (UITabBarController *)rootVC;
//        tabbarFrame = tabbar.tabBar.frame;
//    }
////    NSLog(@"\n\
////          status:%@\n\
////          nav:%@\n\
////          tabbar:%@",
////          NSStringFromCGRect(statusBarFrame),
////          NSStringFromCGRect(navbarFrame),
////          NSStringFromCGRect(tabbarFrame))
//    CGFloat bannerTop;
//    if (self.mjBannerPosition == KMJBannerPositionTop) {
//        bannerTop = CGRectGetHeight(statusBarFrame) + CGRectGetHeight(navbarFrame) + CGRectGetHeight(tabbarFrame);
//    } else if (self.mjBannerPosition == KMJBannerPositionBottom) {
//        bannerTop = kMainScreen_height - CGRectGetHeight(tabbarFrame) - kADBannerHeight;
//    } else {
//        NSAssert(NO, @"目前不支持该类型!");
//    }
//    CGRect bannerFrame = CGRectMake(0,
//                                    bannerTop,
//                                    CGRectGetWidth(kMainScreen),
//                                    kADBannerHeight);
//    [__sharedInstance setFrame:bannerFrame];
//    [__sharedInstance.mjBanner setFrame:CGRectMake(0, 0, CGRectGetWidth(bannerFrame), CGRectGetHeight(bannerFrame))];
//}
//- (void)mjreset:(NSNotification *)notification{
//    NSLog(@"\n\
//          name:%@\n\
//          object:%@\n\
//          userInfo:%@",
//          notification.name,
//          notification.object,
//          notification.userInfo);
//    [self mjreset];
//}
//- (void)mjreset{
//    [self setMJBannerFrame];
//    [self masonry];
//}
//- (void)updateConstraints{
//    [super updateConstraints];
//    [self mjreset];
//}
//- (void)masonry
//{//
//    UIView *superView = self;
//    //
//    [self.mjBanner mas_makeConstraints:^(MASConstraintMaker *make) {
//        //
//        make.edges.equalTo(superView);
//        make.size.equalTo(self);
//    }];
//    [self.btnClose mas_makeConstraints:^(MASConstraintMaker *make) {
//        //
//        make.top.equalTo(self.mjBanner).offset(5);
//        make.right.equalTo(self.mjBanner).offset(-5);
//        make.size.mas_equalTo(CGSizeMake(15, 15));
//    }];
//    [self.mjLabADLogo mas_makeConstraints:^(MASConstraintMaker *make) {
//        //
//        make.left.equalTo(self.mjBanner).offset(2.f);
//        make.bottom.equalTo(self.mjBanner).offset(-2.f);
//    }];
//
//}
//- (void)dealloc{
//    [[NSNotificationCenter defaultCenter]removeObserver:self];
//}

@end

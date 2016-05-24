//
//  MJInterstitial.m
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/13.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJInterstitial.h"

@interface MJInterstitial ()
{
    
}
/** <#注释#>*/
@property (nonatomic,retain)UIControl *mjHudView;
/** <#注释#>*/
@property (nonatomic,retain)UIButton *mjCloseBtn;
/** <#注释#>*/
@property (nonatomic,assign)CGRect mjInterstitialCurrentFrame;
/** <#注释#>*/
@property (nonatomic,assign)CGRect oldFrame;

@end

static MJInterstitial *__sharedInstance = nil;

@implementation MJInterstitial

#pragma mark -
#pragma mark - 插屏广告初始化及设置
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [__sharedInstance setUp];
    });
    
    return __sharedInstance;
}
- (void)setUp{
    [self setBackgroundColor:[UIColor clearColor]];
    self.interstitialViewType = KMJInterstitialTypeHalfScreen;
    self.defaultMaskType =
                                                        LXMJViewMaskTypeGradient;
//    LXMJViewMaskTypeBlack;
    
    [self addSubview:self.mjHudView];
    [self.mjHudView addSubview:self.mjLabADLogo];
    [self registerNotifications];
    [self setNeedsUpdateConstraints];
    [self setNeedsLayout];
}
//+ (instancetype)setup{
//    MJInterstitial *mjInterstitial = [[self alloc]init];
//    [mjInterstitial setBackgroundColor:[UIColor clearColor]];
//    mjInterstitial.interstitialViewType = KMJInterstitialHalfScreenType;
//    mjInterstitial.defaultMaskType =
//    //                                                        LXMJViewMaskTypeGradient;
//                                                                LXMJViewMaskTypeBlack;
//    
//    [mjInterstitial addSubview:mjInterstitial.mjHudView];
//    [mjInterstitial.mjHudView addSubview:mjInterstitial.mjLabADLogo];
//    [mjInterstitial registerNotifications];
//    [mjInterstitial setNeedsUpdateConstraints];
//    [mjInterstitial setNeedsLayout];
//    return mjInterstitial;
//}
//- (void)updateInterstitialViewType
//{
//    CGRect bounds;
//    switch (self.interstitialViewType)
//    {
//            case KMJInterstitialFullScreenType: {
//                bounds = kMJInterstitialFullScreenBounds;
//                break;
//            }
//            case KMJInterstitialHalfScreenType: {
//                bounds = kMJInterstitialHalfScreenBounds;
//                break;
//            }
//    }//switch
//    //    CGFloat r = kMainScreen_width - CGRectGetWidth(bounds);
//    //    CGFloat h = kMainScreen_height - CGRectGetHeight(bounds);
//    //    [self.mjHudView setBounds:bounds];
//    CGPoint origin = CGPointMake((kMainScreen_width - CGRectGetWidth(bounds)) / 2.f, (kMainScreen_height - CGRectGetHeight(bounds)) / 2.f);
//    CGRect frame = CGRectMake(origin.x, origin.y, CGRectGetWidth(bounds), CGRectGetHeight(bounds));
//    CGRect hudBounds = CGRectMake(0, 0, CGRectGetWidth(bounds), CGRectGetHeight(bounds));
//    [self setFrame:kMainScreen];
//    [self.mjHudView setFrame:frame];
//    UIImageView *imgView = [self.mjHudView viewWithTag:123456];
//    [imgView setFrame:hudBounds];
//    self.mjInterstitialCurrentFrame = self.mjHudView.frame;
//}
//- (void)willMoveToSuperview:(UIView *)newSuperview
//{
//    
//    [self.mjCloseBtn setFrame:CGRectMake(CGRectGetWidth(self.mjInterstitialCurrentFrame) - 20, 5, 15, 15)];
//    
////    [self.mjLabADLogo setFrame:CGRectMake(10, CGRectGetHeight(self.mjHudView.frame) - 20, 15, 15)];
//    [self updateInterstitialViewType];
//    //
////    CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.MJInterstitialCurrentFrame), CGRectGetHeight(self.MJInterstitialCurrentFrame));
////    [_mjHudView setBounds:frame];
////    [_mjHudView setCenter:self.center];
//    
//    
//    
//}
//#pragma mark -
//#pragma mark - events
//- (void)MJInterstitialClicked:(id)sender{
//    if ([self.delegate respondsToSelector:@selector(mjClickInterstitialView:)])
//    {
//        [self.delegate mjClickInterstitialView:sender];
//    }
//}
//- (void)showCloseIco
//{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        //
//        [self.mjHudView addSubview:self.mjCloseBtn];
//    });
//    
//}
//#pragma mark -
//#pragma mark - 显示|隐藏 - 动画
//- (void)show{
//    //
//    id supView = mjSuperiew();
//    [self mjreset];
//    [supView addSubview:__sharedInstance];
//    
//    //动画
//    [self showAnimation];
//    
//    if ([self.delegate respondsToSelector:@selector(mjShowInterstitialView:error:)])
//    {
//        [self.delegate mjShowInterstitialView:__sharedInstance error:nil];
//    }
//    
//    //
////    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [__sharedInstance showCloseIco];
////    });
//}
//- (void)showAnimation{
//    id view_t = (MJInterstitial *)self.mjHudView;
//    self.oldFrame = self.frame;
//    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
//    anim.springBounciness = 15;
//    CGFloat centerY = CGRectGetMidY(kMainScreen);
//    CGRect from = CGRectMake(0, centerY, 0, 0);
//    CGRect to;
//    to.origin = kMainScreen_center;
//    to.size = self.mjInterstitialCurrentFrame.size;
//    //    to.size = kMainScreen_size;
//    anim.fromValue = [NSValue valueWithCGRect:from];
//    anim.toValue = [NSValue valueWithCGRect:to];
//    [view_t pop_addAnimation:anim forKey:@"size"];
//}
//- (void)close{
//    // 执行动画
//    [self closeAnimation];
//}
//- (void)closeAnimation{
//    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
//    CGFloat centerY = CGRectGetMidY(kMainScreen);
//    CGRect to = CGRectMake(3600, centerY, 0, 0);
//    anim.toValue = [NSValue valueWithCGRect:to];
//    [self pop_addAnimation:anim forKey:@"size"];
//    anim.completionBlock = ^(POPAnimation *anim, BOOL finished){
//        [self setFrame:self.oldFrame];
//        [self.mjCloseBtn removeFromSuperview];
//        [self removeFromSuperview];
//    };
//    
//    
//    if ([self.delegate respondsToSelector:@selector(mjCloseInterstitialView:)])
//    {
//        [self.delegate mjCloseInterstitialView:self];
//    }
//}
//#pragma mark - mjSuperiew
//static id mjSuperiew()
//{
//    id mjSuperView;
//    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
//    mjSuperView = keyWindow;
//    return mjSuperView;
//}
//#pragma mark - mjCloseBtn
//- (UIButton *)mjCloseBtn
//{
//    if(!_mjCloseBtn){
//        _mjCloseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
////        [_mjCloseBtn setImage:[UIImage imageNamed:@"插屏关闭按钮"] forState:UIControlStateNormal];
////        [_mjCloseBtn.layer setBorderColor:[UIColor blackColor].CGColor];
////        [_mjCloseBtn.layer setBorderWidth:1.f];
//        //        [_mjCloseBtn setFrame:CGRectMake(CGRectGetWidth(self.MJInterstitialCurrentFrame) - 30, -8, 40, 40)];
////        [_mjCloseBtn setBackgroundColor:[UIColor clearColor]];
//        [_mjCloseBtn setTitle:@"✕" forState:UIControlStateNormal];
//        [_mjCloseBtn setTitleColor:[UIColor colorFromHexString:@"#cccccc"] forState:UIControlStateNormal];
//        [_mjCloseBtn.titleLabel setFont:[UIFont systemFontOfSize:12.f]];
//        [_mjCloseBtn bk_addEventHandler:^(id sender) {
//            //
//            [self close];
//        } forControlEvents:UIControlEventTouchUpInside];
//        
//    }
//    
//    return _mjCloseBtn;
//}
//#pragma mark - MJInterstitial
//- (UIControl *)mjHudView
//{
//    if(!_mjHudView){
//        _mjHudView = [[UIControl alloc]init];
//        [_mjHudView setBackgroundColor:[UIColor clearColor]];
//        //        CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.MJInterstitialCurrentFrame), CGRectGetHeight(self.MJInterstitialCurrentFrame));
//        //        [_mjHudView setBounds:frame];
//        //        [_mjHudView setCenter:self.center];
//        [_mjHudView addTarget:self action:@selector(MJInterstitialClicked:) forControlEvents:UIControlEventTouchUpInside];
//        
//        UIImageView *imgView = [[UIImageView alloc]init];
//        [imgView setFrame:_mjHudView.bounds];
//        [imgView setImage:[UIImage imageNamed:@"插屏广告样式"]];
////        [imgView.layer setCornerRadius:15.f];
////        [imgView.layer setMasksToBounds:YES];
//        [imgView setContentMode:UIViewContentModeScaleAspectFill];
//        [imgView setTag:123456];
//        [_mjHudView addSubview:imgView];
//        
//    }
//    
//    return _mjHudView;
//}
//
//#pragma mark -
//#pragma mark - 适配
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
//- (void)updateConstraints{
//    [super updateConstraints];
//    [self masonry];
//    [self mjreset];
//}
//- (void)mjreset{
//    [self updateInterstitialViewType];
//    [self updateMask];
//}
//#pragma mark -
//#pragma mark - Masonry Methods
//- (void)masonry
//{//[self masonry];
//    UIView *superView = self;
//    CGFloat padding = 8;
//    UIEdgeInsets edge = UIEdgeInsetsMake(padding, padding, padding, padding);
//    CGSize size = self.interstitialViewType == 0 ? kMJInterstitialHalfScreenBounds.size : kMJInterstitialFullScreenBounds.size;
//    //
//    [self.mjHudView mas_makeConstraints:^(MASConstraintMaker *make) {
//        //
//        make.center.equalTo(self);
//        make.size.mas_equalTo(size);
//    }];
//    [self.mjLabADLogo mas_makeConstraints:^(MASConstraintMaker *make) {
//        //
//        make.left.equalTo(self.mjHudView).offset(2.f);
//        make.bottom.equalTo(self.mjHudView).offset(-2.f);
//    }];
//
//
//}




@end

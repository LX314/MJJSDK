//
//  MJBaseInterstitial.m
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/20.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJBaseInterstitial.h"

@implementation MJBaseInterstitial

- (void)setUp{
    [self.btnClose.titleLabel setFont:[UIFont systemFontOfSize:15.f]];
    [self setFrame:CGRectMake(0, 0, 300.f, 250.f)];
    [self addSubview:self.imgView];
    [self addSubview:self.mjLabADLogo];
    [self addSubview:self.btnClose];
}
#pragma mark -
#pragma mark - Masonry Methods
- (void)updateConstraints{
    [super updateConstraints];
    //
    [self masonry];
}
- (void)masonry
{//
    UIView *superView = self;
    //
    [self.btnClose mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.top.equalTo(superView).offset(5);
        make.right.equalTo(superView).offset(-5);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    [self.mjLabADLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.left.equalTo(superView).offset(2.f);
        make.bottom.equalTo(superView).offset(-2.f);
    }];
    
    
}
#pragma mark - imgView
- (UIImageView *)imgView
{
    if(!_imgView){
        _imgView = [[UIImageView alloc]init];
        [_imgView setImage:[UIImage imageNamed:@"插屏广告样式"]];
        [_imgView setContentMode:UIViewContentModeScaleAspectFill];
    }
    
    return _imgView;
}
#pragma mark -
#pragma mark - 显示|隐藏 - 动画
//- (void)show{
//    //
//    id supView = mjSuperiew();
//    [self mjreset];
//    [supView addSubview:self];
//
//    //动画
//    [self showAnimation];
//
//    if ([self.delegate respondsToSelector:@selector(mjShowInterstitialView:error:)])
//    {
//        [self.delegate mjShowInterstitialView:__sharedInstance error:nil];
//    }
    
    //
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//    [__sharedInstance showCloseIco];
    //    });
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
#pragma mark - mjSuperiew
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
//        //        [_mjCloseBtn setImage:[UIImage imageNamed:@"插屏关闭按钮"] forState:UIControlStateNormal];
//        //        [_mjCloseBtn.layer setBorderColor:[UIColor blackColor].CGColor];
//        //        [_mjCloseBtn.layer setBorderWidth:1.f];
//        //        [_mjCloseBtn setFrame:CGRectMake(CGRectGetWidth(self.MJInterstitialCurrentFrame) - 30, -8, 40, 40)];
//        //        [_mjCloseBtn setBackgroundColor:[UIColor clearColor]];
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
//- (UIControl *)mjInterstitial
//{
//    if(!_mjInterstitial){
//        _mjInterstitial = [[UIControl alloc]init];
//        [_mjInterstitial setBackgroundColor:[UIColor clearColor]];
//        //        CGRect frame = CGRectMake(0, 0, CGRectGetWidth(self.MJInterstitialCurrentFrame), CGRectGetHeight(self.MJInterstitialCurrentFrame));
//        //        [_mjHudView setBounds:frame];
//        //        [_mjHudView setCenter:self.center];
//        [_mjInterstitial addTarget:self action:@selector(mjInterstitialClicked:) forControlEvents:UIControlEventTouchUpInside];
//        
//        UIImageView *imgView = [[UIImageView alloc]init];
//        [imgView setFrame:_mjHudView.bounds];
//        [imgView setImage:[UIImage imageNamed:@"插屏广告样式"]];
//        //        [imgView.layer setCornerRadius:15.f];
//        //        [imgView.layer setMasksToBounds:YES];
//        [imgView setContentMode:UIViewContentModeScaleAspectFill];
//        [imgView setTag:123456];
//        [_mjInterstitial addSubview:imgView];
//        
//    }
//    
//    return _mjInterstitial;
//}
//- (void)mjInterstitialClicked:(id)sender{
//    
//}
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
@end

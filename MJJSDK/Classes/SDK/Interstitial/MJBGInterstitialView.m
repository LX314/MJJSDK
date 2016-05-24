//
//  MJBGInterstitialView.m
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/20.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJBGInterstitialView.h"

#import "Macro.h"
#import "MJGradientLayer.h"

#import "MJIMGInterstitial.h"
#import "MJGLInterstitial.h"

@interface MJBGInterstitialView ()
{
    
}
/** <#注释#>*/
@property (nonatomic,retain)CALayer *bgLayer;
/** <#注释#>*/
@property (nonatomic,retain)UIView *mjInterstitialView;

@end
@implementation MJBGInterstitialView
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
+ (instancetype)sharedInstance {
    static MJBGInterstitialView *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[[self class] alloc]init];
        [_sharedInstance setUp];
        [[NSNotificationCenter defaultCenter]addObserver:_sharedInstance selector:@selector(mjInterstitialClick:) name:kMJSDKDidClosedNotification object:nil];
    });
    
    return _sharedInstance;
}
static BOOL isShow = NO;
- (void)mjInterstitialClick:(NSNotification *)notification{
    if (!isShow) {
        isShow = !isShow;
        
//        NSLog(@"\n\
//              frame3333:%@\n\
//              View:%@",NSStringFromCGRect(img.imgView.frame),
//              NSStringFromCGRect(self.mjInterstitialView.frame));
        
//        return;
    }
    isShow = !isShow;
    [self.bgLayer removeFromSuperlayer];
    self.bgLayer = nil;
    [self removeFromSuperview];
}
- (void)setUp{
    [self setFrame:kMainScreen];
    [self addSubview:self.mjInterstitialView];
//    [self updateInterstitialType];
}
- (void)mjreset
{
    [super mjreset];
    //
    //    [self setFrame:CGRectMake(0, 65, kMainScreen_width, kADBannerHeight)];
    //    [self masonry];
    [self updateInterstitialFrame];
}
- (void)updateInterstitialFrame{
    [self setFrame:kMainScreen];
    [self updateMask];
}
- (void)updateState{
    [self updateInterstitialStyle];
    [self updateInterstitialType];
    [self updateMask];
    [self masonryStyle];
}
+ (void)show{
    [[MJBGInterstitialView sharedInstance]show];
}
- (void)show{
    //
    if (self.defaultMaskType == LXMJViewMaskTypeNone) {
        self.defaultMaskType = LXMJViewMaskTypeGradient;
    }
    if (self.mjInterstitialType == KMJInterstitialTypeNone) {
        self.mjInterstitialType = KMJInterstitialTypeHalfScreen;
    }
    if (self.mjInterstitialStyle == KMJInterstitialNoneStyle) {
        self.mjInterstitialStyle = KMJInterstitialIMGStyle;
    }
    //
    [self updateState];
    [mjSuperiew() addSubview:self];
}
- (void)setMjInterstitialStyle:(KMJInterstitialStyle)mjInterstitialStyle
{
    if (_mjInterstitialStyle != mjInterstitialStyle) {
        _mjInterstitialStyle = mjInterstitialStyle;
        [self updateInterstitialStyle];
    }
}
- (void)updateInterstitialStyle{
//    [[MJIMGInterstitial sharedInstance] removeFromSuperview];
//    [[MJGLInterstitial sharedInstance] removeFromSuperview];
    
    switch (self.mjInterstitialStyle) {
        case KMJInterstitialNoneStyle: {
            NSAssert(NO, @"ERROR");
            break;
        }
        case KMJInterstitialIMGStyle: {
            //
            [self.mjInterstitialView addSubview:[MJIMGInterstitial sharedInstance]];
            break;
        }
        case KMJInterstitialGLStyle: {
            //
            [self.mjInterstitialView addSubview:[MJGLInterstitial sharedInstance]];
            break;
        }
    }
}
- (void)setMjInterstitialType:(KMJInterstitialType)mjInterstitialType{
    if (_mjInterstitialType != mjInterstitialType) {
        _mjInterstitialType = mjInterstitialType;
//        [self updateInterstitialType];
    }
}
- (void)updateInterstitialType
{
    switch (self.mjInterstitialType) {
        case KMJInterstitialTypeFullScreen: {
            [self masonryFullScreen];
            break;
        }
        case KMJInterstitialTypeHalfScreen: {
            [self masonryHalfScreen];
            break;
        }
        case KMJInterstitialTypeNone: {
            //
            NSAssert(NO, @"ERROR");
            break;
        }
        default:{
            NSAssert(NO, @"ERROR");
        }
    }
}
- (void)updateMask{
    if (self.bgLayer) {
        [self.bgLayer removeFromSuperlayer];
        self.bgLayer = nil;
    }
    
    switch (self.defaultMaskType)
    {
        case LXMJViewMaskTypeCustom:
        case LXMJViewMaskTypeBlack:{
            
            self.bgLayer = [CALayer layer];
            self.bgLayer.frame = self.bounds;
            self.bgLayer.backgroundColor = self.defaultMaskType == LXMJViewMaskTypeCustom ? self.bgLayerColor.CGColor : [UIColor colorWithWhite:0 alpha:0.4].CGColor;
            [self.bgLayer setNeedsDisplay];
            
            [self.layer insertSublayer:self.bgLayer atIndex:0];
            break;
        }
            
        case LXMJViewMaskTypeGradient:{
            MJGradientLayer *layer = [MJGradientLayer layer];
            self.bgLayer = layer;
            self.bgLayer.frame = self.bounds;
            CGPoint gradientCenter = self.center;
//            gradientCenter.y = (self.bounds.size.height - self.visibleKeyboardHeight)/2;
            layer.gradientCenter = gradientCenter;
            [self.bgLayer setNeedsDisplay];
            
            [self.layer insertSublayer:self.bgLayer atIndex:0];
            break;
        }
        case LXMJViewMaskTypeNone: {
            //
            NSAssert(NO, @"发生错误!");
            break;
        }
        case LXMJViewMaskTypeClear: {
            //
            NSAssert(NO, @"发生错误!");
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
#pragma mark - Masonry Methods
- (void)updateConstraints{
    [super updateConstraints];
    //
    [self updateState];
}
- (void)masonryHalfScreen
{//[self masonry];
    UIView *superView = self;
    //
    [self.mjInterstitialView mas_remakeConstraints:^(MASConstraintMaker *make) {
        //
        make.center.equalTo(superView);
        make.size.mas_equalTo(CGSizeMake(300.f, 250.f));
    }];
    

}
- (void)masonryFullScreen
{//[self masonry];
    UIView *superView = self;
    //
    [self.mjInterstitialView mas_remakeConstraints:^(MASConstraintMaker *make) {
        //
        make.edges.equalTo(superView);
    }];
    [self masonryStyle];
}
- (void)masonryStyle{
    UIView *superView = self.mjInterstitialView;
    if ([superView.subviews count] <= 0) {
        return;
    }
    if (self.mjInterstitialStyle == KMJInterstitialIMGStyle) {
        MJIMGInterstitial *img = [MJIMGInterstitial sharedInstance];
        [img mas_remakeConstraints:^(MASConstraintMaker *make) {
            //
            make.edges.equalTo(superView);
        }];
        
    } else if(self.mjInterstitialStyle == KMJInterstitialGLStyle){
        MJGLInterstitial *gl = [MJGLInterstitial sharedInstance];
        [gl mas_remakeConstraints:^(MASConstraintMaker *make) {
            //
            make.edges.equalTo(superView);
        }];
        
    }
}
#pragma mark - mjInterstitialView
- (UIView *)mjInterstitialView
{
    if(!_mjInterstitialView){
        _mjInterstitialView = [[UIView alloc]init];
        
    }
    
    return _mjInterstitialView;
}

@end

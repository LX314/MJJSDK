//
//  ADView.m
//  sdk-ADView
//
//  Created by John LXThyme on 4/22/16.
//  Copyright © 2016 John LXThyme. All rights reserved.
//

#import "MJView.h"

#import "MJGradientLayer.h"

#define kMJViewWillAppear @""

@interface MJView ()
{
    
}
@property (nonatomic, strong) CALayer *backgroundLayer;

@property (nonatomic, readonly) CGFloat visibleKeyboardHeight;

@end
@implementation MJView
+ (instancetype)sharedInstance {
    static MJView *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[[self class] alloc]init];
    });
    
    return _sharedInstance;
}
- (instancetype)init{
    if (self = [super init]) {
        [self initial];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initial];
    }
    return self;
}
- (void)initial{
    [self setBackgroundColor:[UIColor clearColor]];
    [self setFrame:kMainScreen];
//    [self setUserInteractionEnabled:NO];
    _defaultMaskType = LXMJViewMaskTypeBlack;
    [self registerNotifications];
}
- (void)registerNotifications {
#if TARGET_OS_IOS
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(positionHUD:)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(mjreset:)
                                                 name:UIApplicationDidChangeStatusBarFrameNotification
                                               object:nil];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(positionHUD:)
//                                                 name:UIKeyboardWillHideNotification
//                                               object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(positionHUD:)
//                                                 name:UIKeyboardDidHideNotification
//                                               object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(positionHUD:)
//                                                 name:UIKeyboardWillShowNotification
//                                               object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(positionHUD:)
//                                                 name:UIKeyboardDidShowNotification
//                                               object:nil];
#endif
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(positionHUD:)
//                                                 name:UIApplicationDidBecomeActiveNotification
//                                               object:nil];
}
- (void)mjreset:(NSNotification *)notification{
    
    [self mjreset];
    
}
- (void)mjreset{
    
}
- (void)positionHUD:(NSNotification*)notification{
    
    CGFloat keyboardHeight = 0.0f;
    double animationDuration = 0.0;
    
    
#if TARGET_OS_IOS
    self.frame = [[[UIApplication sharedApplication] delegate] window].bounds;
    UIInterfaceOrientation orientation = UIApplication.sharedApplication.statusBarOrientation;
#endif
    BOOL ignoreOrientation = NO;
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 80000
    if([[NSProcessInfo processInfo] respondsToSelector:@selector(operatingSystemVersion)]) {
        ignoreOrientation = YES;
    }
#endif
    
#if TARGET_OS_IOS
    // Get keyboardHeight in regards to current state
    if(notification) {
        
        NSDictionary* keyboardInfo = [notification userInfo];
        CGRect keyboardFrame = [keyboardInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        animationDuration = [keyboardInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
        
        if(notification.name == UIKeyboardWillShowNotification || notification.name == UIKeyboardDidShowNotification) {
            keyboardHeight = CGRectGetWidth(keyboardFrame);
            
            if(ignoreOrientation || UIInterfaceOrientationIsPortrait(orientation)) {
                keyboardHeight = CGRectGetHeight(keyboardFrame);
            }
        }
    } else {
        
        keyboardHeight = self.visibleKeyboardHeight;
    }
    
#endif
    
    
    
//    [self updateMask];
}
- (void)updateMask {
    
    if(self.backgroundLayer) {
        
        [self.backgroundLayer removeFromSuperlayer];
        self.backgroundLayer = nil;
        
    }
    
    switch (self.defaultMaskType) {
            
        case LXMJViewMaskTypeCustom:
        case LXMJViewMaskTypeBlack:{
            
            self.backgroundLayer = [CALayer layer];
            self.backgroundLayer.frame = self.bounds;
            self.backgroundLayer.backgroundColor = self.defaultMaskType == LXMJViewMaskTypeCustom ? self.backgroundLayerColor.CGColor : [UIColor colorWithWhite:0 alpha:0.4].CGColor;
            [self.backgroundLayer setNeedsDisplay];
            
            [self.layer insertSublayer:self.backgroundLayer atIndex:0];
            break;
        }
            
        case LXMJViewMaskTypeGradient:{
            MJGradientLayer *layer = [MJGradientLayer layer];
            self.backgroundLayer = layer;
            self.backgroundLayer.frame = self.bounds;
            CGPoint gradientCenter = self.center;
            gradientCenter.y = (self.bounds.size.height - self.visibleKeyboardHeight)/2;
            layer.gradientCenter = gradientCenter;
            [self.backgroundLayer setNeedsDisplay];
            
            [self.layer insertSublayer:self.backgroundLayer atIndex:0];
            break;
        }
        default:
            break;
    }
}
- (CGFloat)visibleKeyboardHeight {
    UIWindow *keyboardWindow = nil;
    for (UIWindow *testWindow in [[UIApplication sharedApplication] windows]) {
        if(![[testWindow class] isEqual:[UIWindow class]]) {
            keyboardWindow = testWindow;
            break;
        }
    }
    
    for (__strong UIView *possibleKeyboard in [keyboardWindow subviews]) {
        if([possibleKeyboard isKindOfClass:NSClassFromString(@"UIPeripheralHostView")] || [possibleKeyboard isKindOfClass:NSClassFromString(@"UIKeyboard")]) {
            return CGRectGetHeight(possibleKeyboard.bounds);
        } else if([possibleKeyboard isKindOfClass:NSClassFromString(@"UIInputSetContainerView")]) {
            for (__strong UIView *possibleKeyboardSubview in [possibleKeyboard subviews]) {
                if([possibleKeyboardSubview isKindOfClass:NSClassFromString(@"UIInputSetHostView")]) {
                    return CGRectGetHeight(possibleKeyboardSubview.bounds);
                }
            }
        }
    }
    return 0;
}



#pragma mark -
#pragma mark - common components
#pragma mark - btnClose
- (UIButton *)btnClose
{
    if(!_btnClose){
        
        //初始化一个 Button
        _btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnClose setFrame:CGRectZero];
        //        [<#btn#> setBackgroundColor:[UIColor <#color#>]];
        
        
        //背景图片
        //        [_btnClose setBackgroundImage:[UIImage imageNamed:@"横幅关闭按钮1"] forState:UIControlStateNormal];
        [_btnClose setTitle:@"✕" forState:UIControlStateNormal];
        [_btnClose setTitleColor:[UIColor colorFromHexString:@"#cccccc"] forState:UIControlStateNormal];
        [_btnClose.titleLabel setFont:[UIFont systemFontOfSize:12.f]];
        //绑定事件
        [_btnClose addTarget:self action:@selector(btnCloseClick:) forControlEvents:UIControlEventTouchUpInside];
        [_btnClose setTag:123456];
        
        
    }
    
    return _btnClose;
}
- (void)btnCloseClick:(id)sender
{
//        UIButton *btn = (UIButton *)sender;
    //
    [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kMJSDKDidClosedNotification" object:self];
}
#pragma mark - mjLabADLogo
- (UILabel *)mjLabADLogo
{
    if(!_mjLabADLogo){
        _mjLabADLogo = [[UILabel alloc]init];
        [_mjLabADLogo setText:@"广告"];
        [_mjLabADLogo setTextColor:[UIColor colorFromHexString:@"#cccccc"]];
        [_mjLabADLogo setFont:[UIFont systemFontOfSize:9.f]];
        
    }
    
    return _mjLabADLogo;
}
@end

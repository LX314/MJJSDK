//
//  MJIMGInterstitial.m
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/20.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJIMGInterstitial.h"
@interface MJIMGInterstitial ()
{
    
}


@end
@implementation MJIMGInterstitial

+ (instancetype)sharedInstance {
    static MJIMGInterstitial *__sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[[self class] alloc]init];
        [__sharedInstance setUp];
    });
    
    return __sharedInstance;
}
- (void)setUp{
    [super setUp];
    [self addSubview:self.mjLabADLogo];
}
//- (void)mjreset
//{
//    [super mjreset];
//    //
////    [self setFrame:CGRectMake(0, 65, kMainScreen_width, kADBannerHeight)];
////    [self masonry];
//    [self updateInterstitialFrame];
//}
//- (void)updateInterstitialFrame{
//    
//}
#pragma mark -
#pragma mark - Masonry Methods
- (void)updateConstraints{
    [super updateConstraints];
    //
    [self masonry];
}
- (void)masonry
{//
    [super masonry];
    UIView *superView = self;
    //
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.edges.equalTo(superView);
    }];


}



@end

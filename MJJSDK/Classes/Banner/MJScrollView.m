//
//  MJScrollView.m
//  MJSDK-iOS
//
//  Created by John LXThyme on 16/5/25.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "MJScrollView.h"

#import "Macro.h"
#import "MJSDKConfiguration.h"
#import "MJGLBanner.h"
#import "MJIMGBanner.h"

#import <Masonry/Masonry.h>


@interface MJScrollView ()<UIScrollViewDelegate>
{
    
}
/** <#注释#>*/
@property (nonatomic,retain)UIScrollView *scroll;
/** <#注释#>*/
@property (nonatomic,retain)MJBaseBanner *scene1;
@property (nonatomic,retain)MJBaseBanner *scene2;
@property (nonatomic,retain)MJBaseBanner *scene3;

@end
@implementation MJScrollView

+ (instancetype)sharedInstance {
    static MJScrollView *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[[self class] alloc]init];
        [_sharedInstance initial];
        [_sharedInstance addSubview:_sharedInstance.scroll];
    });
    
    return _sharedInstance;
}

- (void)initial
{
    /**
     *初始化相关配置
     *
     */
    //
    
    [self.scroll setContentOffset:CGPointZero];
    [self.scroll setBounces:NO];
    [self.scroll setPagingEnabled:YES];
//    [self.scroll setScrollEnabled:NO];
    [self.scroll setShowsVerticalScrollIndicator:NO];
    [self.scroll setShowsHorizontalScrollIndicator:NO];
    [self.scroll setDelegate:self];
    [self addPage:0];
//    [self addPage:1];
//    [self addPage:2];
    [self.scroll setContentSize:CGSizeMake(kMainScreen_width * 3, kADBannerHeight)];
}
- (void)addPage:(CGFloat)index{
//    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(index * CGRectGetWidth(self.scroll.frame), 0, CGRectGetWidth(self.scroll.frame), kADBannerHeight)];
//    NSString *imgName = [NSString stringWithFormat:@"sc%ld", [@(index) integerValue] + 1];
//    [imgView setImage:[UIImage imageNamed:imgName]];
//    UILabel *lab = [[UILabel alloc]init];
//    [lab setFrame:CGRectMake(0, 0, 60, 40)];
//    [lab setText:imgName];
//    [lab setTextColor:[UIColor whiteColor]];
//    [lab setTextAlignment:NSTextAlignmentCenter];
//    [imgView addSubview:lab];
//    MJGLBanner *gl = [[MJGLBanner alloc]init];
    self.scene1 = [[MJGLBanner alloc]init];
    self.scene2 = [[MJIMGBanner alloc]init];
    self.scene3 = [[MJGLBanner alloc]init];
    
    [self.scene1 setFrame:CGRectMake(0, 0, kMainScreen_width, kADBannerHeight)];
    [self.scene2 setFrame:CGRectMake(kMainScreen_width, 0, kMainScreen_width, kADBannerHeight)];
    [self.scene3 setFrame:CGRectMake(kMainScreen_width * 2, 0, kMainScreen_width, kADBannerHeight)];
    [self.scroll addSubview:self.scene1];
    [self.scroll addSubview:self.scene2];
    [self.scroll addSubview:self.scene3];
    
    [self.scene1 fill:nil];
}
- (void)fill:(KMJPushType)type content:(NSDictionary *)params{
    //    [self.scene1 fill];
    NSInteger ind = rand() % 2 + 1;
    MJBaseBanner *a;
    MJBaseBanner *b;
    if (ind == 1) {
        a = self.scene1;
        b = self.scene3;
    } else {
        a = self.scene2;
    }
    
    [a fill:params];
    [b fill:params];

}
- (void)scroll:(KMJPushType)type params:(NSDictionary *)params{
    NSInteger currentIndex = self.scroll.contentOffset.x / kMainScreen_width;
    [self fill:type content:params];
    [self scroll:type];
    
}
static BOOL isScroll = NO;
- (void)scroll:(KMJPushType)type{
    if (isScroll) {
        NSLog(@"Scrolling");
        return;
    }
    NSInteger currentIndex = self.scroll.contentOffset.x / kMainScreen_width;
    if (currentIndex == 0 && type == KMJPushTypePre){
        [self.scroll setContentOffset:CGPointMake(2 *kMainScreen_width, 0) animated:NO];
    } else if(currentIndex == 2 && type == KMJPushTypeNext){
        [self.scroll setContentOffset:CGPointMake(0, 0) animated:NO];
    }
    isScroll = YES;
    CGFloat offsetX = self.scroll.contentOffset.x;
    offsetX = type == KMJPushTypePre ? (offsetX - kMainScreen_width) : (offsetX + kMainScreen_width);
    [self.scroll setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}
#pragma mark -
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    isScroll = NO;
    NSInteger currentIndex = self.scroll.contentOffset.x / kMainScreen_width;
    if (currentIndex == 0){//offsetX >= 0 && offsetX < kMainScreen_width
        [scrollView setContentOffset:CGPointMake(2 *kMainScreen_width, 0) animated:NO];
    } else if(currentIndex == 2){//offsetX >= kMainScreen_width * 2 && offsetX < kMainScreen_width * 3
        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
    }
}
#pragma mark -
#pragma mark - Masonry Methods
- (void)updateConstraints{
    [super updateConstraints];
    //
    [self masonry];
}
- (void)masonry
{//[self masonry];
    UIView *superView = self;
    //
//    [self.scroll mas_makeConstraints:^(MASConstraintMaker *make) {
//        //
//        make.edges.equalTo(superView);
//    }];

}

#pragma mark - scroll
- (UIScrollView *)scroll
{
    if(!_scroll){
        _scroll = [[UIScrollView alloc]init];
        [_scroll setFrame:CGRectMake(0, 0, kMainScreen_width, kADBannerHeight)];
    }
    
    return _scroll;
}

@end

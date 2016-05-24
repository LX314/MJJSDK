//
//  MJGLBanner.m
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/19.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJGLBanner.h"
@interface MJGLBanner ()
{
    
}
/** <#注释#>*/
@property (nonatomic,retain)UIImageView *imgView_logo;
/** <#注释#>*/
@property (nonatomic,retain)UIButton *btn_dl;
/** <#注释#>*/
@property (nonatomic,retain)UILabel *lab_title;
/** <#注释#>*/
@property (nonatomic,retain)UILabel *lab_detail;

@end
@implementation MJGLBanner


+ (instancetype)sharedInstance {
    static MJGLBanner  *__sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[[self class] alloc]init];
        [__sharedInstance setUp];
    });
    
    return __sharedInstance;
}
- (void)setUp{
    //
    [self setBackgroundColor:[UIColor colorFromHexString:@"#fffffa"]];
    [self setFrame:CGRectMake(0, kMainScreen_height - kADBannerHeight, kMainScreen_width, kADBannerHeight)];
    //
    [self addSubview:self.imgView_logo];
    [self addSubview:self.lab_title];
    [self addSubview:self.lab_detail];
    [self addSubview:self.btn_dl];
    [super setUp];
    [self setNeedsUpdateConstraints];
    [self setNeedsLayout];
}


#pragma mark -
#pragma mark - Masonry Methods
- (void)updateConstraints{
    [super updateConstraints];
    //
//    [self setBackgroundColor:[UIColor lightGrayColor]];
//    [self.layer setBorderColor:[UIColor blackColor].CGColor];
//    [self.layer setBorderWidth:1.f];
//    [self.layer setMasksToBounds:YES];
//    [self.imgView_logo.layer setBorderColor:[UIColor blackColor].CGColor];
//    [self.imgView_logo.layer setBorderWidth:1.f];
    [self masonry];
}
- (void)masonry
{//[self masonry];
    [super masonry];
    UIView *superView = self;
    CGFloat padding = 8;
    //
    NSLog(@"Frame:%@",NSStringFromCGRect(self.frame));
    [self.imgView_logo mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.left.equalTo(superView).offset(10);
        make.centerY.equalTo(superView);
//        make.size.mas_equalTo(CGSizeMake(27, 27));
    }];
    [self.lab_title mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.top.equalTo(self.imgView_logo);
        make.left.equalTo(self.imgView_logo.mas_right).offset(8);
    }];
    [self.lab_detail mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.top.equalTo(self.lab_title.mas_bottom).offset(5);
        make.left.equalTo(self.lab_title);
    }];
    [self.btn_dl mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.right.equalTo(superView).offset(-10);
        make.centerY.equalTo(superView);
    }];
}

#pragma mark - imgView_logo
- (UIImageView *)imgView_logo
{
    if(!_imgView_logo){
        _imgView_logo = [[UIImageView alloc]init];
        [_imgView_logo setImage:[UIImage imageNamed:@"墙类APP75x75"]];
    }
    
    return _imgView_logo;
}
#pragma mark - btn_dl
- (UIButton *)btn_dl
{
    if(!_btn_dl){
        
        //初始化一个 Button
        _btn_dl = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn_dl setFrame:CGRectZero];
        
        //背景图片
        [_btn_dl setBackgroundImage:[UIImage imageNamed:@"下载按钮"] forState:UIControlStateNormal];
        
        //绑定事件
        [_btn_dl addTarget:self action:@selector(btn_dlClick:) forControlEvents:UIControlEventTouchUpInside];
        [_btn_dl setTag:123456];
    }
    
    return _btn_dl;
}

- (void)btn_dlClick:(id)sender
{
//    UIButton *btn = (UIButton *)sender;
    //
    
}
#pragma mark - lab_title
- (UILabel *)lab_title
{
    if(!_lab_title){
        //初始化一个 Label
        _lab_title = [[UILabel alloc]init];
        [_lab_title setFrame:CGRectZero];
        [_lab_title setText:@"萌店"];
//        [_lab_title setAdjustsFontSizeToFitWidth:<#YES#>];
        [_lab_title setTextColor:[UIColor colorFromHexString:@"#000000"]];
        [_lab_title setFont:[UIFont systemFontOfSize:18.f]];
        [_lab_title setTextAlignment:NSTextAlignmentLeft];
    }
    
    return _lab_title;
}
#pragma mark - lab_detail
- (UILabel *)lab_detail
{
    if(!_lab_detail){
        //初始化一个 Label
        _lab_detail = [[UILabel alloc]init];
        [_lab_detail setFrame:CGRectZero];
        [_lab_detail setText:@"新生活 · 新买卖"];
        //        [_lab_detail setAdjustsFontSizeToFitWidth:<#YES#>];
        [_lab_detail setTextColor:[UIColor  colorFromHexString:@"#878787"]];
        [_lab_detail setFont:[UIFont systemFontOfSize:10.f]];
        [_lab_detail setTextAlignment:NSTextAlignmentLeft];
        
    }
    
    return _lab_detail;
}

@end

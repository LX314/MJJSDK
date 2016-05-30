//
//  MJRECell.m
//  sdk-ADView
//
//  Created by WM on 16/5/24.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#define imageWidth roundf(([UIScreen mainScreen].bounds.size.width/320 * (100 - 10)) * 210 / 90)
#define btn_detailHeight roundf((([UIScreen mainScreen].bounds.size.width * 2 - imageWidth * 2 - 70) * 30 / 150) / 2)




#import "MJRECell.h"

@interface MJRECell () {


}

//注释
@property (nonatomic,retain)UIImageView * imageView_show;
//注释
@property (nonatomic,retain)UIImageView * imageView_logo;
//注释
@property (nonatomic,retain)UIView * whiteView;
//注释
@property (nonatomic,retain)UILabel * lab_content;
//注释
@property (nonatomic,retain)UIButton * btn_detail;


@end

@implementation MJRECell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        //
        [self initial];
    }
    return self;
}

- (void)initial
{
    /**
     *初始化相关配置
     *
     */
    [self setBackgroundColor:[UIColor colorFromHexString:@"#e5e5e5"]];
    
    //
    [self.contentView addSubview:self.imageView_show];
    [self.contentView addSubview:self.whiteView];
    [self.whiteView addSubview:self.imageView_logo];
    [self.whiteView addSubview:self.lab_content];
    [self.whiteView addSubview:self.btn_detail];
    
    [self setNeedsUpdateConstraints];
    [self setNeedsLayout];
}
- (void)fill {
    
    [self.whiteView setBackgroundColor:[UIColor whiteColor]];
    [self.lab_content setText:@"梦幻般的真实\nRPG大作"];
    [self.btn_detail setTitle:@"我要分享" forState:UIControlStateNormal];
    
}
#pragma mark -
#pragma mark - Masonry Methods
- (void)updateConstraints{
    
    [super updateConstraints];
    
    [self masonry];
    
}


- (void)masonry
{//[self masonry];
    
    UIView *superView = self.contentView;
    //
    [self.imageView_show mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.left.equalTo(superView).offset(10.f);
        make.top.equalTo(superView).offset(10.f);
        make.bottom.equalTo(superView);
        make.width.equalTo(self.whiteView).multipliedBy(21/9);
        
    }];
    
    [self.whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.imageView_show.mas_right);
        make.top.equalTo(self.imageView_show);
        make.right.equalTo(superView).offset(-10.f);
        make.bottom.equalTo(superView);

    }];
    
    [self.imageView_logo mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.top.equalTo(self.whiteView).offset(8.f);
        make.left.equalTo(self.imageView_show.mas_right).offset(8.f);
        make.right.equalTo(self.whiteView.mas_right).offset(-8.f);
//        make.height.equalTo(@(image_logoHeight));
        make.width.equalTo(self.imageView_logo.mas_height).multipliedBy(150/45);

    }];

    [self.btn_detail mas_makeConstraints:^(MASConstraintMaker *make) {
        
//        make.left.equalTo(self.whiteView.mas_left).offset(8.f);
//        make.right.equalTo(self.whiteView.mas_right).offset(-8.f);
        make.width.equalTo(self.imageView_logo.mas_width);
        make.centerX.equalTo(self.whiteView);
        make.bottom.equalTo(self.whiteView.mas_bottom).offset(-5.f);
        make.height.equalTo(@(btn_detailHeight));
//        make.width.equalTo(self.btn_detail.mas_height).multipliedBy(5/1);

    }];
//    
    [self.lab_content mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.imageView_logo.mas_bottom).offset(3.f);
        make.centerX.equalTo(self.whiteView);
        make.bottom.equalTo(self.btn_detail.mas_top).offset(-3.f);
        
    }];
//
}

#pragma mark - imageView_show
-(UIImageView *)imageView_show {

    if (!_imageView_show) {
        
        _imageView_show = [[UIImageView alloc]init];
        [_imageView_show setImage:[UIImage imageNamed:@"魔灵召唤banner420x180"]];
    }

    return _imageView_show;

}


#pragma mark - bgView
-(UIView *)whiteView {
    
    if (!_whiteView) {
        
        _whiteView = [[UIView alloc]init];

    }
    
    return _whiteView;
}


#pragma mark - imageView_logo
-(UIImageView *)imageView_logo {

    if (!_imageView_logo) {
        
        _imageView_logo = [[UIImageView alloc]init];
        [_imageView_logo setImage:[UIImage imageNamed:@"魔灵召唤logo"]];
    }

    return _imageView_logo;

}

#pragma mark - lab_content
-(UILabel *)lab_content {

    if (!_lab_content) {
        
        _lab_content = [[UILabel alloc]init];
        _lab_content.textColor = [UIColor colorFromHexString:@"#787878"];
        _lab_content.adjustsFontSizeToFitWidth = YES;
        _lab_content.numberOfLines = 2;
        _lab_content.textAlignment = NSTextAlignmentCenter;
        
    }

    return _lab_content;
}

#pragma mark - btn_detail
-(UIButton *)btn_detail {

    if (!_btn_detail) {
        _btn_detail = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn_detail setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn_detail.titleLabel.font = [UIFont systemFontOfSize:12.f];
        [_btn_detail setBackgroundColor:[UIColor colorFromHexString:@"#63d300"]];
        [_btn_detail addTarget:self action:@selector(btn_detailClick:) forControlEvents:UIControlEventTouchUpInside];
        [_btn_detail.layer setCornerRadius:3.f];
    }
    
    return _btn_detail;

}

-(void)btn_detailClick:(id)sender {

    NSLog(@"我要分享");
}

@end

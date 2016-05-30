//
//  MJBannerManager.m
//  MJSDK-iOS
//
//  Created by John LXThyme on 16/5/27.
//  Copyright © 2016年 WM. All rights reserved.
//

#import "MJBannerManager.h"

#import "Macro.h"

#import "MJIMGBanner.h"
#import "MJGLBanner.h"

#import <Masonry/Masonry.h>

@interface MJBannerManager ()<UITableViewDelegate,UITableViewDataSource>
{
    
}
/** <#注释#>*/
@property (nonatomic,retain)UITableView *table;
/** <#注释#>*/
@property (nonatomic,retain)NSArray *arrayData;

@end
@implementation MJBannerManager
- (instancetype)init{
    if (self = [super init]) {
        [self setUp];
    }
    return self;
}
+ (instancetype)sharedInstance {
    static MJBannerManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[[self class] alloc]init];
        [_sharedInstance setUp];
    });
    
    return _sharedInstance;
}
- (void)setUp{
//    [self.table setFrame:CGRectMake(0, 0, kMainScreen_width, kADBannerHeight / 2.f)];
//    self.table.frame = CGRectMake(0, 0, kMainScreen_width, kADBannerHeight);
    [self.table setPagingEnabled:YES];
    [self.table setRowHeight:kADBannerHeight];
    [self.table setDelegate:self];
    [self.table setDataSource:self];
    [self addSubview:self.table];
    [self setNeedsUpdateConstraints];
    [self setNeedsLayout];
}
- (void)scrollToPre{
    NSArray *array = [self.table indexPathsForVisibleRows];
    if ([array count] <= 0 && [array count] > 1) {
        NSAssert(NO, @"ERROR");
        return;
    }
    NSIndexPath *indexPath = array[0];
    indexPath = [NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section];
    if (indexPath.row < 0) {
        return;
    }
    [self.table scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:NO];
}
- (void)scrollToNext{
    NSArray *array = [self.table indexPathsForVisibleRows];
    if ([array count] <= 0) {// || [array count] > 1
        NSAssert(NO, @"ERROR");
        return;
    }
    NSIndexPath *indexPath = [array firstObject];
    indexPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:indexPath.section];
    if (indexPath.row + 1 > [self.arrayData count]) {
        return;
    }
    [self.table scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:NO];
}
#pragma mark - TableView Required Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.arrayData[indexPath.row][@"type"] isEqualToString:@"IMG"]) {
        static NSString *cellIdentifier = @"cellIdentifierIMG";
        MJIMGBanner *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell)
        {
            cell = [[MJIMGBanner alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        //configuration cell...
        [cell fill:@{
                     @"index": [@(indexPath.row) stringValue]
                     }];
        return cell;
    } else if ([self.arrayData[indexPath.row][@"type"] isEqualToString:@"GL"]) {
        static NSString *cellIdentifier = @"cellIdentifierGL";
        MJGLBanner *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell)
        {
            cell = [[MJGLBanner alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        //configuration cell...
        [cell fill:@{
                     @"index": [@(indexPath.row) stringValue]
                     }];
        return cell;
    } else {
        NSAssert(NO, @"ERROR");
    }
    return nil;
}
#pragma mark - TableView Optional Methods
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"position.x"];
    anim.fromValue = @(kMainScreen_width * 1.5);
    anim.toValue = @(kMainScreen_width / 2.f);
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [cell.layer addAnimation:anim forKey:@"CellAnimation"];

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - arrayData
- (NSArray *)arrayData
{
    if(!_arrayData){
        _arrayData = @[
                       @{@"type":@"IMG"},
                       @{@"type":@"GL"},
                       @{@"type":@"IMG"},
                       @{@"type":@"GL"},
                       @{@"type":@"IMG"},
                       @{@"type":@"GL"},
                       @{@"type":@"IMG"},
                       @{@"type":@"GL"},
                       @{@"type":@"IMG"},
                       @{@"type":@"GL"}
                       ];
        
    }
    
    return _arrayData;
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
    if (!self) {
        return;
    }
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.edges.equalTo(self);
        make.width.mas_greaterThanOrEqualTo(@(kMainScreen_width));
        make.height.mas_greaterThanOrEqualTo(@20.f);
    }];

}
- (void)dealloc{
    [self.table removeObserver:self forKeyPath:@"frame"];
}
#pragma mark - table
- (UITableView *)table
{
    if(!_table){
        //初始化一个 tableView
        //
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.tableFooterView = [[UIView alloc]init];
//        if (kIOSVersion >= 7.f) {
//            _table.estimatedRowHeight = 44.f;
//        }
//        _table.rowHeight = UITableViewAutomaticDimension;
        
        //        [_table setDataSource:self];
        
        //        [_table setBackgroundColor:[UIColor <#color#>]];
        
//                [_table setIndicatorStyle:UIScrollViewIndicatorStyleBlack];
        //        [_table setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
        //        [_table setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
        [_table setShowsVerticalScrollIndicator:NO];
        [_table setShowsHorizontalScrollIndicator:NO];
        
    }
    
    return _table;
}

@end

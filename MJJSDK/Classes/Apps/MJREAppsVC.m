//
//  MJREAppsVC.m
//  sdk-ADView
//
//  Created by WM on 16/5/24.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJREAppsVC.h"

#import "MJRECell.h"

@interface MJREAppsVC ()<UITableViewDelegate,UITableViewDataSource>
{
    
}

/** <#注释#>*/
@property (nonatomic,retain)NSArray * dataSource;


@end

@implementation MJREAppsVC

- (void)viewDidLoad{
    
    [super viewDidLoad];
    //
    [self.table setRowHeight:roundf([UIScreen mainScreen].bounds.size.width / 320 * 100)];
    [self.table setDelegate:self];
    [self.table setDataSource:self];
    [self.view addSubview:self.table];
    
    //Hidden line
    self.table.separatorStyle = NO;
    //
    
    [self changeTitle];
    [self.view setNeedsUpdateConstraints];
    [self.view setNeedsLayout];
    
    
}

#pragma mark - titleChange
-(void)changeTitle {

    self.title = @"精彩推荐";
    [self.navigationController.navigationBar setTitleTextAttributes:
  @{
    NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:20],
    NSForegroundColorAttributeName:[UIColor colorFromHexString:@"#2e95fe"]}];
}

#pragma mark - TableView Required Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * identifier = @"REcell";
    
    MJRECell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[MJRECell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //configuration cell...

    [cell fill];
    
    //make cell can't be click
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}
#pragma mark - TableView Optional Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBar.hidden animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return roundf([UIScreen mainScreen].bounds.size.width / 320 * 100);
//    return 375.f / 320 * 100;

}
#pragma mark -
#pragma mark - Masonry Methods
- (void)mjreset{
    [super mjreset];
    //
    [self masonry];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    //
    [self masonry];
}
- (void)masonry
{//
    UIView *superView = self.view;
    //
    [self.table mas_makeConstraints:^(MASConstraintMaker *make) {
        //
        make.edges.equalTo(superView);
    }];
    
    
}

#pragma mark - arrayData
- (NSArray *)dataSource
{
    if(!_dataSource){
        
        _dataSource = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];
        
    }
    
    return _dataSource;
}

@end

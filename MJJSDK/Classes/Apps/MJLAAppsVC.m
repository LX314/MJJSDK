//
//  MJLAApps.m
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/23.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJLAAppsVC.h"

#import "MJLACell.h"

@interface MJLAAppsVC ()<UITableViewDelegate,UITableViewDataSource>
{
    
}
/** <#注释#>*/
@property (nonatomic,retain)NSArray *arrayData;


@end
@implementation MJLAAppsVC
- (void)viewDidLoad{
    [super viewDidLoad];
    //
    [self.table setRowHeight:50.f];
    [self.table setDelegate:self];
    [self.table setDataSource:self];
    [self.view addSubview:self.table];
    //
    [self.view setNeedsUpdateConstraints];
    [self.view setNeedsLayout];
}
#pragma mark - TableView Required Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    MJLACell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[MJLACell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        //        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //configuration cell...
    [cell fill];
    
    return cell;
}
#pragma mark - TableView Optional Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBar.hidden animated:YES];
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
- (NSArray *)arrayData
{
    if(!_arrayData){
        _arrayData = @[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10];
        
    }
    
    return _arrayData;
}

@end

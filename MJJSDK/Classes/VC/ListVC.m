//
//  ListVC.m
//  sdk-ADView
//
//  Created by John LXThyme on 16/4/27.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "ListVC.h"

@interface ListVC ()<UITableViewDelegate,UITableViewDataSource>
{
    
}
/** <#注释#>*/
@property (nonatomic,retain)NSArray *arrayData;


@end

@implementation ListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //
    [self initial];
}
- (void)initial
{
    /**
     *初始化相关配置
     *
     */
    self.title = @"List";
    //
    [self.table setFrame:CGRectMake(0, 69, kMainScreen_width, kMainScreen_height - 69)];
    [self.table setRowHeight:80.f];
    [self.table setDelegate:self];
    [self.table setDataSource:self];
    [self.view addSubview:self.table];
}

#pragma mark - TableView Required Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayData count] * 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    //configuration cell...
    [cell.textLabel setText:[@(indexPath.row) stringValue]];//
    return cell;
}
#pragma mark - TableView Optional Methods
//给cell添加动画
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    //设置Cell的动画效果为3D效果
    //设置x和y的初始值为0.1；
//    cell.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1);
    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    //x和y的最终值为1
    [UIView animateWithDuration:1 animations:^{
        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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

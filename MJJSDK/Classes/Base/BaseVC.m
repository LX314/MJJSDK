//
//  BaseVC.m
//  sdk-ADView
//
//  Created by John LXThyme on 16/4/27.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC ()<UITableViewDataSource>

@end

@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //
    self.automaticallyAdjustsScrollViewInsets = NO;
    //
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - table
- (UITableView *)table
{
    if(!_table){
        //初始化一个 tableView
        //
        _table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _table.tableFooterView = [[UIView alloc]init];
        if (kIOSVersion >= 7.f) {
            _table.estimatedRowHeight = 44.f;
        }
        _table.rowHeight = UITableViewAutomaticDimension;
        
//        [_table setDataSource:self];
        
//        [_table setBackgroundColor:[UIColor <#color#>]];
        
//        [_table setIndicatorStyle:UIScrollViewIndicatorStyleBlack];
//        [_table setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
//        [_table setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];

    }
    
    return _table;
}
#pragma mark - TableView Required Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
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
    
    return cell;
}




@end

//
//  MJBaseApps.m
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/23.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJBaseApps.h"
@interface MJBaseApps ()<UITableViewDataSource,UITableViewDelegate>
{
    
}

@end
@implementation MJBaseApps




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
#pragma mark - TableView Optional Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark - tableApps
- (UITableView *)tableApps
{
    if(!_tableApps){
        //初始化一个 tableView
        //
        _tableApps = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableApps.tableFooterView = [[UIView alloc]init];
        _tableApps.estimatedRowHeight = 44.0f;
        _tableApps.rowHeight = UITableViewAutomaticDimension;
        
        [_tableApps setDelegate:self];
        [_tableApps setDataSource:self];
        
//        [_tableApps setBackgroundColor:[UIColor <#color#>]];
        
//        [_tableApps setIndicatorStyle:<#(UIScrollViewIndicatorStyle)#>];
//        [_tableApps setKeyboardDismissMode:UIScrollViewKeyboardDismissModeOnDrag];
//        [_tableApps setSeparatorStyle:<#(UITableViewCellSeparatorStyle)#>];
        

        
    }
    
    return _tableApps;
}
@end

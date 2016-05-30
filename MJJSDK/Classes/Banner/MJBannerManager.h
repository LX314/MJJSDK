//
//  MJBannerManager.h
//  MJSDK-iOS
//
//  Created by John LXThyme on 16/5/27.
//  Copyright © 2016年 WM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJBannerManager : UIView
{
    
}
@property (nonatomic,retain, readonly)UITableView *table;


- (void)scrollToPre;
- (void)scrollToNext;

@end

//
//  MJBaseAppsVC.m
//  sdk-ADView
//
//  Created by John LXThyme on 16/5/23.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "MJBaseAppsVC.h"
@interface MJBaseAppsVC ()
{
    
}
/** <#注释#>*/
@property (nonatomic,assign)id presentVC;


@end
@implementation MJBaseAppsVC
- (void)viewDidLoad{
    [super viewDidLoad];
    //
    [self registerNotifications];
}
- (void)show{
    UIViewController *vc_t = self;//[[[self class] alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc_t];
    [vc_t setTitle:@"应用墙"];
    UIBarButtonItem *rightBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClick:)];
    vc_t.navigationItem.rightBarButtonItem = rightBtnItem;
    self.presentVC = mjSuperiew().rootViewController;
    id rootVC = mjSuperiew().rootViewController;
    if ([rootVC isKindOfClass:[UITableViewController class]] || [rootVC isKindOfClass:[UIViewController class]]) {
//        [rootVC presentViewController:nav animated:YES completion:nil];
    } else if([rootVC isKindOfClass:[UINavigationController class]]){
        self.presentVC = [rootVC topViewController];
    } else {
        NSAssert(NO, @"ERROR");
    }
    [self.presentVC presentViewController:nav animated:YES completion:nil];
}
- (void)dismiss{
    [self.presentVC dismissViewControllerAnimated:YES completion:nil];
}
- (void)rightItemClick:(id)sender{
    [self dismiss];
}

- (void)registerNotifications {
#if TARGET_OS_IOS
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(positionHUD:)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(mjreset:)
                                                 name:UIApplicationDidChangeStatusBarFrameNotification
                                               object:nil];
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(positionHUD:)
    //                                                 name:UIKeyboardWillHideNotification
    //                                               object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(positionHUD:)
    //                                                 name:UIKeyboardDidHideNotification
    //                                               object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(positionHUD:)
    //                                                 name:UIKeyboardWillShowNotification
    //                                               object:nil];
    //
    //    [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(positionHUD:)
    //                                                 name:UIKeyboardDidShowNotification
    //                                               object:nil];
#endif
    //    [[NSNotificationCenter defaultCenter] addObserver:self
    //                                             selector:@selector(positionHUD:)
    //                                                 name:UIApplicationDidBecomeActiveNotification
    //                                               object:nil];
}
- (void)mjreset:(NSNotification *)notification{
    [self mjreset];
}
- (void)mjreset{
    
}
@end

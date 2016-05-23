//
//  LXViewController.m
//  LXTool
//
//  Created by LX314 on 05/23/2016.
//  Copyright (c) 2016 LX314. All rights reserved.
//

#import "LXViewController.h"

#import "LXTool.h"

@interface LXViewController ()

@end

@implementation LXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [LXTool get:@"" params:@{} success:^(NSURLSessionDataTask * _Nonnull dataTask, id  _Nullable responseObject) {
        //
    } failure:^(NSURLSessionDataTask * _Nullable dataTask, NSError * _Nonnull error) {
        //
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

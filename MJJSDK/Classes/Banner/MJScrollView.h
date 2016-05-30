//
//  MJScrollView.h
//  MJSDK-iOS
//
//  Created by John LXThyme on 16/5/25.
//  Copyright © 2016年 WM. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KMJPushType) {
    KMJPushTypePre = 1,
    KMJPushTypeNext = 2
};

@interface MJScrollView : UIView
{
    
}
@property (nonatomic,retain,readonly)UIScrollView *scroll;


+ (instancetype)sharedInstance;

- (void)scroll:(KMJPushType)type;
- (void)scroll:(KMJPushType)type params:(NSDictionary *)params;

@end

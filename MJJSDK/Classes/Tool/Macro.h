//
//  Macro.h
//  GithubDemo001
//
//  Created by FairyLand on 15/3/30.
//  Copyright (c) 2015年 fulan. All rights reserved.
//

#ifndef GithubDemo001_Macro_h
#define GithubDemo001_Macro_h

/*!
 *  是否开启测试模式
 *          beta:打开
 *          生产环境:关闭
 */
//#define kLXTestApp 1

#define kTabBarNav ({\
    AppDelegate* appDelegate = [[UIApplication sharedApplication]  delegate];\
    UINavigationController *navTabbar = (UINavigationController *)[[appDelegate window] rootViewController];\
    navTabbar;\
})

/**
 *  适配
 */
# define kMainScreen [[UIScreen mainScreen]bounds]
# define kMainScreen_size [[UIScreen mainScreen]bounds].size
# define kMainScreen_height [[UIScreen mainScreen]bounds].size.height
# define kMainScreen_width [[UIScreen mainScreen]bounds].size.width
# define kMainScreen_center CGPointMake(CGRectGetMidX(kMainScreen), CGRectGetMidY(kMainScreen))

//Alert 消息
#define kAlertMSGNil(__msg__) [[[UIAlertView alloc]initWithTitle:@"温馨提示" message:(__msg__) delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil]show]

#define kIOSVersion [[[UIDevice currentDevice]systemVersion]floatValue]

/**Test Bg Color
 *  [UIColor cyanColor]
 *  [UIColor whiteColor]
 *  [UIColor clearColor]
 */
#define kTestBGColor [UIColor clearColor]
//#define kTestBGColor [UIColor cyanColor]
#define kHexColor(__hexCode__) [UIColor colorFromHexCode:__hexCode__]
#define kWhiteColor [UIColor colorFromHexCode:@"#fff"]
#define kYellowColor [UIColor colorFromHexCode:@"#ffb031"]
#define kBlueColor [UIColor colorFromHexCode:@"#15a5fe"]
#define kDarkGrayColor [UIColor colorFromHexCode:@"#7d7d7d"]
#define kLightGrayColor [UIColor colorFromHexCode:@"#b3b3b3"]
#define kBgGrayColor [UIColor colorFromHexCode:@"#ededed"]
#define kRedColor [UIColor colorFromHexCode:@"#e60012"]
#define kBlackColor [UIColor colorFromHexCode:@"#000"]
#define kLineColor [UIColor colorFromHexCode:@"#cfcfcf"]

#define kScale(__size__) ({\
CGFloat scale = [UIScreen mainScreen].scale;\
(__size__) * scale / 3.f;\
})

#define kFont(__size__) ({\
UIFont *font = [UIFont systemFontOfSize:kScale(__size__)];\
font;\
})

/***************__***************/
#ifndef kNSLog_AllStruct
#define kNSLog_AllStruct YES
#define kNSLog_CGRect(_rect_) NSLog(@"%s x=%.2f, y=%.2f, w=%.2f, h=%.2f", #_rect_, _rect_.origin.x, _rect_.origin.y,_rect_.size.width, _rect_.size.height)
#define kNSLog_CGSize(_size_) NSLog(@"%s w=%.2f, h=%.2f", #_size_, _size_.width, _size_.height)
#define kNSLog_CGPoint(_point_) NSLog(@"%s x=%.2f, y=%.2f", #_point_, _point_.x, _point_.y)
#define kNSLog_NSIndexPath(_indexPath_) NSLog(@"%s_row:%d\tsection:%d",@_indexPath_,_indexPath_.row,_indexPath_.section);
#define kNSLog_UIEdges(_edges_) NSLog(@"%s left=%f, right=%f, top=%f, bottom=%f",#_edges_, _edges_.left, _edges_.right,_edges_.top, _edges_.bottom)
#define kNSLog_UIColorHSV(_color_) NSLog(@"%s h=%f, s=%f, v=%f", #_color_, _color_.hue, _color_.saturation, _color_.value)
#define kNSLog_AllSubviews(_view_) \
{\
for (UIView* view = _view_; view; view = view.superview)\
{ \
NSLog(@"%@", view);\
} \
}
#endif

#ifndef kLXTestApp
#ifndef NSLog
#define NSLog(format, ...) do {                                                                          \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "-------\n");                                               \
} while (0);
#endif

#else
#define NSLog(format, ...)
#endif

#endif





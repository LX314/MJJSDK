//
//  AnimationVC.m
//  sdk-ADView
//
//  Created by John LXThyme on 16/4/27.
//  Copyright © 2016年 John LXThyme. All rights reserved.
//

#import "AnimationVC.h"

@interface AnimationVC ()

@end

@implementation AnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UIView 动画
- (void)uiViewAnimation{
    NSTimeInterval interval = 2;
    NSTimeInterval delay = 2;
//    [UIView animateWithDuration:interval animations:<#^(void)animations#>
//    [UIView animateWithDuration:interval animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>];
//    [UIView animateWithDuration:interval delay:delay options:<#(UIViewAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>];
    /** 弹性动画
     * damping:阻尼，范围0-1，阻尼越接近于0，弹性效果越明显
     * velocity:弹性复位的速度
     */
//    [UIView animateWithDuration:interval delay:delay usingSpringWithDamping:<#(CGFloat)#> initialSpringVelocity:<#(CGFloat)#> options:<#(UIViewAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>];
    //关键帧动画
//    [UIView animateKeyframesWithDuration:interval delay:delay options:<#(UIViewKeyframeAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>];
}
/**
 *  @brief CoreAnimation - 核心动画
 *  CAAnimation：核心动画的基础类，不能直接使用，负责动画运行时间、速度的控制，本身实现了CAMediaTiming协议。
 *  CAPropertyAnimation：属性动画的基类（通过属性进行动画设置，注意是可动画属性），不能直接使用。
 *  CAAnimationGroup：动画组，动画组是一种组合模式设计，可以通过动画组来进行所有动画行为的统一控制，组中所有动画效果可以并发执行。
 *  CATransition：转场动画，主要通过滤镜进行动画效果设置。
 *  CABasicAnimation：基础动画，通过属性修改进行动画参数控制，只有初始状态和结束状态。
 *  CAKeyframeAnimation：关键帧动画，同样是通过属性进行动画参数控制，但是同基础动画不同的是它可以有多个状态控制。
 *  基础动画、关键帧动画都属于属性动画，就是通过修改属性值产生动画效果，开发人员只需要设置初始值和结束值，中间的过程动画（又叫“补间动画”）由系统自动计算产生。和基础动画不同的是关键帧动画可以设置多个属性值，每两个属性中间的补间动画由系统自动完成，因此从这个角度而言基础动画又可以看成是有两个关键帧的关键帧动画。
 */
- (void)coreAnimation{
    
}
//CABasicAnimation
- (void)CABasicAnimation{
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    [scale setDuration:.5f];
    [scale setTimingFunction:[CAMediaTimingFunction functionWithName:@"kCAMediaTimingFunctionEaseInEaseOut"]];//`linear', `easeIn', `easeOut' and `easeInEaseOut' and `default'
    [scale setFromValue:@(1)];
    [scale setToValue:@(1.5)];
    [scale setFillMode:kCAFillModeBoth];//`backwards', `forwards', `both' and `removed'
    UIView *view_t;
    [view_t.layer addAnimation:scale forKey:@"scaleAnimation"];
}

@end

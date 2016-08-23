//
//  WLQStatusBarHUD.m
//  WLQStatusBarHUD
//
//  Created by admin on 16/8/23.
//  Copyright (c) 2016年 WLQ. All rights reserved.
//

#import "WLQStatusBarHUD.h"

#define WLQTextFont [UIFont systemFontOfSize:14]

static CGFloat const WLQDurationTime = 0.2;
static CGFloat const WLQTimeInterval = 2.0;


@implementation WLQStatusBarHUD
/** 全局窗口 */
static UIWindow *window_;
/** 全局定时器 */
static NSTimer *timer_;

/**
 *  创建窗口
 */
+ (void)setupWindow
{
    
    // frame数据
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 创建窗口
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.windowLevel = UIWindowLevelStatusBar;
    window_.backgroundColor = [UIColor blackColor];
    window_.hidden = NO;
    
    // 添加动画
    frame.origin.y = 0;
    [UIView animateWithDuration:WLQDurationTime animations:^{
        window_.frame = frame;
    }];
    
}

/**
 *  显示自定义文字和自定义图片
 */
+ (void)showMessage:(NSString *)meg image:(UIImage *)image
{
    // 停止定时器
    [timer_ invalidate];
    
    // 创建窗口
    [self setupWindow];
    
    // 添加按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = window_.bounds;
    [btn setTitle:meg forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    btn.titleLabel.font = WLQTextFont;
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    [window_ addSubview:btn];
    
    // 添加定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:WLQTimeInterval target:self selector:@selector(hidden) userInfo:nil repeats:NO];
}

/**
 *  显示成功
 */
+ (void)showSuccess:(NSString *)meg
{
    [WLQStatusBarHUD showMessage:meg image:[UIImage imageNamed:@"WLQStatusBarHUD.bundle/success"]];
}

/**
 *  显示失败
 */
+ (void)showError:(NSString *)meg
{
    [WLQStatusBarHUD showMessage:meg image:[UIImage imageNamed:@"WLQStatusBarHUD.bundle/error"]];
}

/**
 *  显示自定义文字
 */
+ (void)showMessage:(NSString *)meg
{
    [WLQStatusBarHUD showMessage:meg image:nil];
}

/**
 *  显示正在加载
 */
+ (void)showLoading:(NSString *)meg
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    // 创建窗口
    [self setupWindow];
    
    // 显示文字
    UILabel *label = [[UILabel alloc] init];
    label.text = meg;
    label.textColor = [UIColor whiteColor];
    label.font = WLQTextFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    [window_ addSubview:label];
    
    // 显示圈圈
    UIActivityIndicatorView *loadView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadView startAnimating];
    CGFloat labelW = [label.text sizeWithAttributes:@{NSFontAttributeName : WLQTextFont}].width;
    CGFloat loadViewX = (window_.bounds.size.width - labelW) * 0.5 - 20;
    loadView.center = CGPointMake(loadViewX, window_.bounds.size.height * 0.5);
    [window_ addSubview:loadView];
    
}

/**
 *  隐藏
 */
+ (void)hidden
{
    [UIView animateWithDuration:WLQDurationTime animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = -window_.frame.size.height;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

@end

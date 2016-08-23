//
//  WLQStatusBarHUD.h
//  WLQStatusBarHUD
//
//  Created by admin on 16/8/23.
//  Copyright (c) 2016年 WLQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLQStatusBarHUD : NSObject
/**
 *  显示成功
 */
+ (void)showSuccess:(NSString *)meg;
/**
 *  显示失败
 */
+ (void)showError:(NSString *)meg;
/**
 *  显示自定义文字
 */
+ (void)showMessage:(NSString *)meg;
/**
 *  显示自定义文字和自定义图片
 */
+ (void)showMessage:(NSString *)meg image:(UIImage *)image;
/**
 *  显示正在加载
 */
+ (void)showLoading:(NSString *)meg;
/**
 *  隐藏
 */
+ (void)hidden;

@end

//
//  ViewController.m
//  WLQStatusBarHUDExample
//
//  Created by admin on 16/8/23.
//  Copyright (c) 2016年 WLQ. All rights reserved.
//

#import "ViewController.h"
#import "WLQStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

/**
 *  显示成功
 */
- (IBAction)success {
    [WLQStatusBarHUD showSuccess:@"显示成功！！！"];
}
/**
 *  显示失败
 */
- (IBAction)error {
    [WLQStatusBarHUD showError:@"显示失败"];
}
/**
 *  显示正在处理事件
 */
- (IBAction)loading {
    [WLQStatusBarHUD showLoading:@"正在加载中..."];
}
/**
 *  隐藏
 */
- (IBAction)hidden {
    [WLQStatusBarHUD hidden];
}
/**
 *  显示自定义文本
 */
- (IBAction)message {
    [WLQStatusBarHUD showMessage:@"哈哈谁说的话"];
}
@end

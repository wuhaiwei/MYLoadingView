//
//  ViewController.m
//  加载View
//
//  Created by  wuhiwi on 16/9/20.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import "ViewController.h"
#import "HWLoadingView.h"

@interface ViewController () <HWLoadingViewDelegate>

@end

@implementation ViewController

#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.5];
    HWLoadingView *loadingView = [HWLoadingView showHWLoadingViewAddedTo:self.view animated:YES];
    loadingView.delegate = self;
}


#pragma mark - HWLoadingViewDelegate
- (void)hwLoadingViewDidClickCancelButton:(UIButton *)button
{
    
}
@end

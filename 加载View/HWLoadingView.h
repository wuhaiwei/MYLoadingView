//
//  HWLoadingView.h
//  加载View
//
//  Created by  wuhiwi on 16/9/22.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HWLoadingViewDelegate <NSObject>
@optional

- (void)hwLoadingViewDidClickCancelButton:(UIButton *)button;

@end

@interface HWLoadingView : UIView

@property (nonatomic, weak) id<HWLoadingViewDelegate>delegate;
/**
 *  添加加载view
 *
 *  @param view     添加到的目的view
 *  @param animated 是否添加动画
 *
 *  @return HWLoadingView 类型对象
 */
+ (HWLoadingView *)showHWLoadingViewAddedTo:(UIView *)view
                                   animated:(BOOL)animated;

/**
 *  移除加载view
 *
 *  @param view     加载view的父视图
 *  @param animated 是否添加动画
 */
+ (void)hideHWLoadingViewForView:(UIView *)view
                      animated:(BOOL)animated;

@end

//
//  UIColor+extend.h
//  加载View
//
//  Created by  wuhiwi on 16/9/22.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (extend)

// 将十六进制颜色的字符串转化为复合iphone/ipad的颜色
// 字符串为"FFFFFF"
+ (UIColor *)hexChangeFloat:(NSString *)hexColor;

@end

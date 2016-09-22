//
//  HWLoadingView.m
//  加载View
//
//  Created by  wuhiwi on 16/9/22.
//  Copyright © 2016年 wanglibank. All rights reserved.
//

#import "HWLoadingView.h"
#import "UIColor+extend.h"

#define kScreenWidth                    [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight                   [[UIScreen mainScreen] bounds].size.height

//当前系统的高度比例
#define kScaleHeight                    kScreenWidth / 568
//当前系统的宽度比例
#define kScaleWidth                     kScreenWidth / 320
#define kOffset                         10.0 * kScaleWidth

/**
 *  字体
 */
#define IS_PLUS                         ([[UIScreen mainScreen] scale] == 3.0f)
#define FontOfSize(_size)               IS_PLUS ? (_size + 2) : _size
#define UIFontWithSize(fontSize)        [UIFont systemFontOfSize:FontOfSize(fontSize)]

static NSString *const kLabelTextHexColor = @"333333";
static NSString *const kButtonTitleHexColor = @"ff6600";

@interface HWLoadingView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UIButton *cancelButton;

@end

@implementation HWLoadingView

+ (HWLoadingView *)showHWLoadingViewAddedTo:(UIView *)view animated:(BOOL)animated
{
    UIImage *image = [UIImage imageNamed:@"ic_loading_circle"];
    CGFloat height = image.size.height + 2 * kOffset;
    HWLoadingView *loadingView = [[self alloc] init];
    loadingView.center = view.center;
    loadingView.bounds = CGRectMake(0, 0, kScreenWidth - 8 * kOffset, height);
    [view addSubview:loadingView];
    loadingView.backgroundColor = [UIColor whiteColor];
    return loadingView;
}

+ (void)hideHWLoadingViewForView:(UIView *)view animated:(BOOL)animated
{
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            [subview removeFromSuperview];
            break;
        }
    }
}

#pragma mark - init
- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.layer.cornerRadius = 6.0;
    self.layer.masksToBounds = YES;
    [self addSubview:self.imageView];
    [self addSubview:self.descriptionLabel];
    [self addSubview:self.cancelButton];
    return self;
}

#pragma mark - setter getter
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        UIImage *image = [UIImage imageNamed:@"ic_loading_circle"];
        _imageView.image = image;
        CGSize size = image.size;
        _imageView.frame = CGRectMake(2 * kOffset, kOffset, size.width, size.height);
    }
    return _imageView;
}

- (UILabel *)descriptionLabel
{
    if (!_descriptionLabel) {
        CGFloat labelHeight = 30.0f;
        CGFloat labelWidth = 80.0f;
        _descriptionLabel = [[UILabel alloc] init];
        _descriptionLabel.center = self.center;
        _descriptionLabel.textAlignment = NSTextAlignmentCenter;
        _descriptionLabel.font = UIFontWithSize(16.0);
        _descriptionLabel.textColor = [UIColor hexChangeFloat:kLabelTextHexColor];
        _descriptionLabel.text = @"加载中...";
        CGFloat originX = CGRectGetMaxX(_imageView.frame) + 2 * kOffset;
        CGFloat originY = CGRectGetMidY(_imageView.frame) - labelHeight / 2;
        _descriptionLabel.frame = CGRectMake(originX, originY, labelWidth, labelHeight);
    }
    return _descriptionLabel;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        CGFloat buttonWidth = 40.0f;
        CGFloat buttonHeight = 40.0f;
        CGFloat originX = CGRectGetMaxX(_descriptionLabel.frame) + 2 * kOffset;
        CGFloat originY = CGRectGetMidY(_descriptionLabel.frame) - buttonWidth / 2;

        _cancelButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _cancelButton.frame = CGRectMake(originX, originY, buttonWidth, buttonHeight);
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        _cancelButton.titleLabel.font = UIFontWithSize(16.0);
        [_cancelButton setTitleColor:[UIColor hexChangeFloat:kButtonTitleHexColor] forState:UIControlStateNormal];
        [_cancelButton addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

#pragma mark - 按钮点击事件
- (void)cancelClick:(UIButton *)button
{
    if ([_delegate respondsToSelector:@selector(hwLoadingViewDidClickCancelButton:)]) {
        [_delegate hwLoadingViewDidClickCancelButton:button];
    }
}
@end

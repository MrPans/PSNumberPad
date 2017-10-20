//
//  PSNumberPad.h
//  numpad
//
//  Created by Pan on 15/9/15.
//  Copyright (c) 2015年 PPPan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PSNumberPad;
NS_ASSUME_NONNULL_BEGIN

@protocol PSNumberPadDelegate <NSObject>

@optional
/**
 Called when `Return` button taped.

 @param pad a pad which had been touched.
 @return YES or NO
 */
- (BOOL)numberPadShouldReturn:(PSNumberPad *)pad;

/**
 Called when user's typed number has reach maximum number
 
 @param pad a pad.
 */
- (void)numberPadDidOverMaxNumber:(PSNumberPad *)pad;

@end


@interface PSNumberPad : UIView

/**
 唯一指定初始化方法，不使用此方法初始化无法使键盘生效。

 @return 一个 PSNumberPad 的实例
 */
- (instancetype)init;

/**
 *  当前焦点的输入框，不设置此属性则无法将数字输入到firstResponse;
 */
@property (nonatomic, strong) UITextField *textField;

/**
 键盘主题色。也许你需要将键盘右下角的确定按钮设为你App的主题色 ：）
 */
@property (nonatomic, strong) UIColor *themeColor;

@property (nonatomic, weak) id<PSNumberPadDelegate> delegate;

@property (nonatomic, assign, getter=isDisableDot) BOOL disableDot;/**< 小数点是否启用*/

@property (nonatomic, assign) NSInteger maxNumber;/**< 允许输入的最大数字，默认为9,999,999*/

NS_ASSUME_NONNULL_END

@end

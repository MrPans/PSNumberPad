//
//  PSNumberPad.h
//  numpad
//
//  Created by Pan on 15/9/15.
//  Copyright (c) 2015年 Insigma Hengtian Software Co., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PSNumberPad;

@interface PSNumberPad : UIView

+ (PSNumberPad *)pad;

/**
 *  当前焦点的输入框，不设置此属性则无法将数字输入到firstResponse;
 */
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, assign, getter=isDisableDot) BOOL disableDot;/**< 小数点是否启用*/
@property (nonatomic, assign) NSInteger maxNumber;/**< 允许输入的最大数字，默认为10,000,000*/

@end

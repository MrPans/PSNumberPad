//
//  PSNumberPad.m
//  numpad
//
//  Created by Pan on 15/9/15.
//  Copyright (c) 2015年 Insigma Hengtian Software Co., LTD. All rights reserved.
//

#import "PSNumberPad.h"


static const NSInteger MaxNumber = 10000000;
static  NSString *const Dot = @".";

@interface PSNumberPad ()

@property (nonatomic, assign) id<UITextInput> textInputDelegate;
@property (nonatomic, weak) IBOutlet UIButton *dotButton;

- (IBAction)touchDeleteButton:(UIButton *)sender;
- (IBAction)touchReturnButton:(UIButton *)sender;
- (IBAction)touchHiddenButton:(UIButton *)sender;
- (IBAction)touchNumberButton:(UIButton *)sender;

@end


@implementation PSNumberPad

+ (PSNumberPad *)pad
{
    NSArray *views = [[NSBundle mainBundle]loadNibNamed:[PSNumberPad description] owner:nil options:nil];
    for (UIView *view in views)
    {
        if ([view isKindOfClass:[PSNumberPad class]])
        {
            return (PSNumberPad *)view;
        }
    }
    return nil;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.dotButton setEnabled:!self.isDisableDot];
}

- (IBAction)touchNumberButton:(UIButton *)sender
{
    NSInteger inputNumber = [sender.titleLabel.text integerValue];
    NSRange dotRange = [_textField.text rangeOfString:Dot];
    CGFloat numberAfterInput = [[NSString stringWithFormat:@"%@%ld", self.textField.text, inputNumber] doubleValue];
    
    if (self.maxNumber <= numberAfterInput)
    {
        self.textField.text = [NSString stringWithFormat:@"%ld", self.maxNumber];
    }
    else if ([self.textField.text isEqualToString:@"0.00"])
    {
        self.textField.text = [NSString stringWithFormat:@"%ld", inputNumber];
    }
    else if (dotRange.location == NSNotFound || self.textField.text.length <= dotRange.location + 2)
    {
        [self.textInputDelegate insertText:[NSString stringWithFormat:@"%ld", inputNumber]];
        if (self.textField.text.length >= 2)
        {
            NSString *str = [self.textField.text substringToIndex:2];
            NSString *first = [self.textField.text substringToIndex:1];
            
            if ((![str isEqualToString:@"0."]) && [first isEqualToString:@"0"])
            {
                _textField.text=[NSString stringWithFormat:@"%d",[_textField.text intValue]];
                
            }
        }
    }
}

- (IBAction)touchDeleteButton:(UIButton *)sender
{
    if ([@"0." isEqualToString:_textField.text]) {
        _textField.text = @"";
        
        return;
    } else {
        
        [self.textInputDelegate deleteBackward];
    }
}

- (IBAction)touchReturnButton:(UIButton *)sender
{
    [self.textField resignFirstResponder];
}

- (IBAction)touchHiddenButton:(UIButton *)sender
{
    [self.textField resignFirstResponder];
}

- (IBAction)touchDotButton:(UIButton *)sender
{
    NSRange dotRange = [_textField.text rangeOfString:Dot];
    if (dotRange.location == NSNotFound && _textField.text.length == 0)
    {
        [self.textInputDelegate insertText:@"0."];
    }
    else if (dotRange.location == NSNotFound)
    {
        [self.textInputDelegate insertText:Dot];
    }
}

#pragma mark - Getter && Setter

- (NSInteger)maxNumber
{
    return _maxNumber ? _maxNumber : MaxNumber;
}

- (void)setTextField:(UITextField *)textField
{
    _textField = textField;
    _textField.inputView = self;
    _textInputDelegate = _textField;
}

- (void)setDisableDot:(BOOL)disableDot
{
    _disableDot = disableDot;
    [_dotButton setEnabled:!_disableDot];
}
@end

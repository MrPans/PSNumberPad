//
//  PSNumberPad.m
//  numpad
//
//  Created by Pan on 15/9/15.
//  Copyright (c) 2015年 Insigma Hengtian Software Co., LTD. All rights reserved.
//

#import "PSNumberPad.h"

#if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
#define IntegerFormatter @"%ld"
#else
#define IntegerFormatter @"%d"
#endif

#define HIGHLIGHT_COLOR [UIColor colorWithRed:170.0/255.0 green:170.0/255.0 blue:170.0/255.0 alpha:0]

static const NSInteger MaxNumber = 10000000;
static NSString *const Dot = @".";
static NSString *const Zero = @"0";
static NSString *const ZeroDot = @"0.";

@interface PSNumberPad ()

@property (nonatomic, assign) id<UITextInput> textInputDelegate;
@property (nonatomic, weak) IBOutlet UIButton *dotButton;
@property (nonatomic, weak) IBOutlet UIButton *deleteButton;
@property (nonatomic, weak) IBOutlet UIButton *confirmButton;

- (IBAction)touchDeleteButton:(UIButton *)sender;
- (IBAction)touchReturnButton:(UIButton *)sender;
- (IBAction)touchHiddenButton:(UIButton *)sender;
- (IBAction)touchNumberButton:(UIButton *)sender;

@end

@interface PSNumberPad (Appearance)

- (void)setupAppearance;

@end

@implementation PSNumberPad

- (instancetype)init
{
    return [[self class] pad];
}

+ (instancetype)pad
{
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:[PSNumberPad description] owner:nil options:nil];
    for (UIView *view in views)
    {
        if ([view isKindOfClass:[PSNumberPad class]])
        {
            PSNumberPad *pad = (PSNumberPad *)view;
            [pad setupAppearance];
            return pad;
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
    NSRange dotRange = [self.textField.text rangeOfString:Dot];
    NSString *fromatterStr = [@"%@" stringByAppendingString:IntegerFormatter];
    CGFloat numberAfterInput = [[NSString stringWithFormat:fromatterStr, self.textField.text, inputNumber] doubleValue];
    
    if (self.maxNumber <= numberAfterInput)
    {
        self.textField.text = [NSString stringWithFormat:IntegerFormatter, self.maxNumber];
    }
    else if ([self.textField.text isEqualToString:@"0.00"])
    {
        self.textField.text = [NSString stringWithFormat:IntegerFormatter, inputNumber];
    }
    else if (dotRange.location == NSNotFound || self.textField.text.length <= dotRange.location + 2)
    {
        [self.textInputDelegate insertText:[NSString stringWithFormat:IntegerFormatter, inputNumber]];
        if (self.textField.text.length >= 2)
        {
            NSString *str = [self.textField.text substringToIndex:2];
            NSString *first = [self.textField.text substringToIndex:1];
            
            if ((![str isEqualToString:ZeroDot]) && [first isEqualToString:Zero])
            {
                self.textField.text=[NSString stringWithFormat:IntegerFormatter,[self.textField.text integerValue]];
                
            }
        }
    }
}

- (IBAction)touchDeleteButton:(UIButton *)sender
{
    if ([self.textField.text isEqualToString:ZeroDot])
    {
        self.textField.text = @"";
        return;
    }
    [self.textInputDelegate deleteBackward];
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
    NSRange dotRange = [self.textField.text rangeOfString:Dot];
    if (dotRange.location == NSNotFound && self.textField.text.length == 0)
    {
        [self.textInputDelegate insertText:ZeroDot];
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

- (void)setThemeColor:(UIColor *)themeColor
{
    _themeColor = themeColor;
    self.confirmButton.backgroundColor = _themeColor;
}

@end


@implementation PSNumberPad (Appearance)

- (void)setupAppearance
{
    UIImage *backgroundImage = [UIImage imageNamed:@"BG"];
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton *)obj;
            [btn setBackgroundImage:backgroundImage forState:UIControlStateHighlighted];
        }
    }];
}

@end

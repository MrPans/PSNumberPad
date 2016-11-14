//
//  ViewController.m
//  PSNumberPadExample
//
//  Created by Pan on 16/1/8.
//  Copyright © 2016年 Sheng Pan. All rights reserved.
//

#import "ViewController.h"
#import "PSNumberPad.h"

@interface ViewController () <PSNumberPadDelegate>

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, strong) PSNumberPad *numberPad;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.numberPad.textField = self.textField;
    self.numberPad.themeColor = [UIColor orangeColor];
    self.numberPad.delegate = self;
}

- (PSNumberPad *)numberPad
{
    if (!_numberPad)
    {
        _numberPad = [[PSNumberPad alloc] init];
    }
    return _numberPad;
}

@end

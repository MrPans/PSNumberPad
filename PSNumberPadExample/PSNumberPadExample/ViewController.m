//
//  ViewController.m
//  PSNumberPadExample
//
//  Created by Pan on 16/1/8.
//  Copyright © 2016年 Sheng Pan. All rights reserved.
//

#import "ViewController.h"
#import "PSNumberPad.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, strong) PSNumberPad *numberPad;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.numberPad.textField = self.textField;
}

- (PSNumberPad *)numberPad
{
    if (!_numberPad)
    {
        _numberPad = [PSNumberPad pad];
    }
    return _numberPad;
}

@end

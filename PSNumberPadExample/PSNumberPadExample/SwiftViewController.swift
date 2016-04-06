//
//  SwiftViewController.swift
//  PSNumberPadExample
//
//  Created by Pan on 16/4/6.
//  Copyright © 2016年 Sheng Pan. All rights reserved.
//

import UIKit

class SwiftViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    lazy var numberPad = PSNumberPad();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        numberPad.textField = textField;
    }
}
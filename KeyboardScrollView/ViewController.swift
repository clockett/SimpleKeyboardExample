//
//  ViewController.swift
//  KeyboardScrollView
//
//  Created by Carolyn Kempkes on 9/5/17.
//  Copyright © 2017 Carolyn Kempkes. All rights reserved.
//

import UIKit

class ViewController: ScrollKeyboardViewController
{
    
    // these outlets are just used for unit tests in this example
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tapGestureRecognizer: UITapGestureRecognizer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // customize this value to the amount of space you want between the
        // keyboard and the textField for this viewController
        offset = 50
    
    }
    
}


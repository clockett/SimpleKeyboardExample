//
//  ScrollKeyboardViewController.swift
//  KeyboardScrollView
//
//  Created by Carolyn Kempkes on 9/5/17.
//  Copyright © 2017 Carolyn Kempkes. All rights reserved.
//

import UIKit

class ScrollKeyboardViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    
    // customize offset to be the amount of space you want for
    // default value between the keyboard and the textField
    var offset:CGFloat = 20

    var currentTextField:UITextField? = nil
    var origContentOffset:CGPoint? = nil
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // this can also be set in IB
        automaticallyAdjustsScrollViewInsets = false
        
        // add aobservers for keyboard show/hide notifications
        NotificationCenter.default.addObserver(self, selector: #selector(ScrollKeyboardViewController.keyboardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ScrollKeyboardViewController.keyboardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardWillHide(_ notification: Notification)
    {
        let contentInsets:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
        // if the content was offset when the keyboard appeared,
        // reset the scroll view to that offset
        if let contentOffset = origContentOffset {
            scrollView.contentOffset = contentOffset
            scrollView.scrollRectToVisible(CGRect(x: contentOffset.x, y: contentOffset.y, width: 1, height: 1), animated: true)
            origContentOffset = nil
        }
    }
    
    @objc func keyboardWillShow(_ notification: Notification)
    {
        if let keyboardSize = ((notification as NSNotification).userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {

            if origContentOffset == nil {
                origContentOffset = scrollView.contentOffset
            }
            let newContentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + offset, right: 0)
            scrollView.contentInset = newContentInsets
            scrollView.scrollIndicatorInsets = newContentInsets
        }
    }
    
    // Tap gesture recognizer
    @IBAction func tapHideKeyboard(_ sender: Any)
    {
        if let textField = currentTextField {
            textField.resignFirstResponder()
        }
    }

}

extension ScrollKeyboardViewController: UITextFieldDelegate {
    
    // Used to handle moving to the next field on "Next" button tap
    // and resigning first responder on "Done" tap
     func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if textField.returnKeyType == .next
        {
            let next:UITextField = self.view.viewWithTag(textField.tag+1) as! UITextField
            next.becomeFirstResponder()
        }
        else if textField.returnKeyType == .done
        {
            textField.resignFirstResponder()
        }
        return false;
    }
    
    // These are used with the tap gesture recognizer
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        currentTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        currentTextField = nil
    }
    
}

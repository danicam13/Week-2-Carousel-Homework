//
//  LoginViewController.swift
//  Week 2 Homework - Carousel
//
//  Created by Camous, Dani on 8/29/16.
//  Copyright © 2016 Dani Camous. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBAction func onBackArrow(sender: AnyObject) {navigationController?.popViewControllerAnimated(true)
    }
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fieldParentView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBOutlet weak var buttonParentView: UIView!
    @IBOutlet weak var signinIndicator: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        scrollView.contentInset.bottom = 100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) { }
 
    func scrollViewWillBeginDragging(scrollView: UIScrollView) { }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) { }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) { }
    
    func keyboardWillShow(notification: NSNotification!) {
     buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
     scrollView.contentOffset.y = scrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) { }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        signinIndicator.startAnimating()
        delay(2) {
            self.validateCredentials()
            self.signinIndicator.stopAnimating()
        }
    }
    
        func validateCredentials() {
            if emailField.text == "camous.dani@gmail.com" && passwordField.text == "password" {
                self.performSegueWithIdentifier("tutorialSegue", sender: self)
    } else {
        if self.emailField.text!.isEmpty {
            let alertController = UIAlertController(title: "Email Required", message: "Please enter an email address", preferredStyle: .Alert)
            _ = UIAlertAction(title: "Ok", style: .Default, handler: { (action) in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
            
            presentViewController(alertController, animated: true, completion: nil)

        } else if self.passwordField.text!.isEmpty {
            let alertController = UIAlertController(title: "Password Required", message: "Please enter a password", preferredStyle: .Alert)
            _ = UIAlertAction(title: "Ok", style: .Default, handler: { (action) in
                self.dismissViewControllerAnimated(true, completion: nil)
            })

            presentViewController(alertController, animated: true, completion: nil)
            }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
}
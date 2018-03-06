//
//  SignUpViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-22.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController
{
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    @IBAction func btnCreateAccountClick(_ sender: UIButton)
    {
        if txtFullName.text == nil || (txtFullName.text?.isEmpty)!
        {
            showError(message: "Full name cannot be empty!");
            return;
        }
        
        if txtEmail.text == nil || (txtEmail.text?.isEmpty)!
        {
            showError(message: "Email cannot be empty!");
            return;
        }
        
        if txtPassword.text == nil || (txtPassword.text?.isEmpty)!
        {
            showError(message: "password cannot be empty!");
            return;
        }
        
        let customer = Customer.createAccount(fullName: txtFullName.text!, email: txtEmail.text!, password: txtPassword.text!);
        
        if customer == nil {
            showError(message: "Email already registered");
        }
        else
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
            let loginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginVC") as! ViewController;
            self.present(loginViewController, animated: true, completion: nil);
        }
    }
    
    private func showError(message:String)
    {
        let alert = UIAlertController(title: "SignUP Failed", message: message, preferredStyle: UIAlertControllerStyle.alert);
        let actionOk = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        alert.addAction(actionOk);
        
        self.present(alert, animated: true, completion: nil);
    }
}

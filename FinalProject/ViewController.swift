//
//  ViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-22.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblVersion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        Customer.createAccount(fullName: "a", email: "b", password: "c")
        
        var versionComplete = ""
        
        if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") {
             versionComplete += "V \(version)"
        }
        if let versionCode = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") {
             versionComplete += "(\(versionCode))"
        }
       
       lblVersion.text = versionComplete
       txtEmail.text = "b"
       txtPassword.text = "c"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }

    @IBAction func btnLoginClick(_ sender: UIButton)
    {
        if Customer.authenticate(email: txtEmail.text ?? "", password: txtPassword.text ?? "") != nil
        {
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
            let homeViewController = storyBoard.instantiateViewController(withIdentifier: "MenuVC") as! MenuTableViewController;
            self.present(homeViewController, animated: true, completion: nil);
        }
        else
        {
            let alert = UIAlertController(title: "Login Failed", message: "Email or password incorrect", preferredStyle: UIAlertControllerStyle.alert);
            let actionOk = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
            alert.addAction(actionOk);
            
            self.present(alert, animated: true, completion: nil);
        }
    }
}


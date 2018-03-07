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
    @IBOutlet weak var swhRememberMe: UISwitch!
    
    var userDefault: UserDefaults!
    var user:Customer?;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        userDefault = UserDefaults.standard;
        
        if let email = userDefault.value(forKey: "email") {
            txtEmail.text = email as? String
        }
        
        if let password = userDefault.value(forKey: "password") {
            txtPassword.text = password as? String
        }
        
        if user == nil {
            user = Customer.createAccount(fullName: "Mr. User", email: "user@mail.com", password: "123");
        }
        
        if user != nil
        {
            txtEmail.text = user?.email;
            txtPassword.text = user?.password;
        }
        
        var versionComplete = ""
        
        if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") {
             versionComplete += "V \(version)"
        }
        
        if let versionCode = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") {
             versionComplete += "(\(versionCode))"
        }
       
        lblVersion.text = versionComplete;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }

    @IBAction func btnLoginClick(_ sender: UIButton)
    {
        if Customer.authenticate(email: txtEmail.text ?? "", password: txtPassword.text ?? "") != nil
        {
            if swhRememberMe.isOn
            {
                userDefault.set(txtEmail.text, forKey: "email")
                userDefault.set(txtPassword.text, forKey: "password")
            }
            else
            {
                userDefault.removeObject(forKey: "email")
                userDefault.removeObject(forKey: "password")
            }
            
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


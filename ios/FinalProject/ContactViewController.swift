//
//  ContactViewController.swift
//  FinalProject
//
//  Created by Franco on 3/5/18.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController
{
    override func viewDidLoad() {
        super.viewDidLoad();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    @IBAction func btnEmailClick(_ sender: UIButton)
    {
        let alert = UIAlertController(title: "Send us a message", message: "", preferredStyle: .alert);
        
        alert.addTextField { textField in
            textField.placeholder = "Message";
        }
        
        let sendAction = UIAlertAction(title: "Send", style: .default)
        { [weak alert] _ in
            if let alert = alert
            {
                let txtMessage = alert.textFields![0] as UITextField;
                
                if txtMessage.text != nil && !(txtMessage.text?.isEmpty)! {
                    self.sendMessage(txtMessage.text!);
                }
                else {
                    self.present(alert, animated: true, completion: nil);
                }
            }
        }
        
        alert.addAction(sendAction);
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel));
        self.present(alert, animated: true, completion: nil);
    }
    
    @IBAction func btnCallClick(_ sender: UIButton)
    {
        if let url = URL(string: "tel://+1123456789)"), UIApplication.shared.canOpenURL(url)
        {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            }
            else {
                UIApplication.shared.openURL(url)
            }
        }
        else {
            showErrorMessage("This device cannot make calls!");
        }
    }
    
    private func showErrorMessage(_ message:String)
    {
        let alert = UIAlertController(title: "Error", message:message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "Ok", style: .default));
        self.present(alert, animated: true, completion: nil);
    }
    
    private func sendMessage(_ message:String)
    {
        if MFMailComposeViewController.canSendMail()
        {
            let picker = MFMailComposeViewController();
            picker.mailComposeDelegate = self;
            picker.setSubject("App Contact");
            picker.setMessageBody(message, isHTML: false);
            
            present(picker, animated: true, completion: nil);
        }
        else {
            showErrorMessage("This device cannot send emails!");
        }
    }
}

extension ContactViewController : MFMailComposeViewControllerDelegate
{
    
}

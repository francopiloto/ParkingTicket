//
//  ProfileViewController.swift
//  FinalProject
//
//  Created by Franco on 3/5/18.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController
{
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtVehicleNumber: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtOldPassword: UITextField!
    @IBOutlet weak var txtNewPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        let user = Customer.getAuthenticatedUser();
        
        lblEmail.text = "Email: \(user?.email ?? "")";
        txtFullName.text = user?.fullName;
        txtVehicleNumber.text = user?.vehicleNumber;
        txtPhoneNumber.text = user?.phoneNumber;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    @IBAction func btnUpdateClick(_ sender: UIButton)
    {
        let fullName = txtFullName.text ?? "";
        
        if fullName.isEmpty
        {
            showError(message: "Enter the Full Name");
            return;
        }
        
        let vehicleNumber = txtVehicleNumber.text ?? "";
        
        if vehicleNumber.isEmpty
        {
            showError(message: "Enter the Vehicle Number");
            return;
        }
        
        let phoneNumber = txtPhoneNumber.text ?? "";
        
        if phoneNumber.isEmpty
        {
            showError(message: "Enter the Phone Number");
            return;
        }
        
        let oldPassword = txtOldPassword.text ?? "";
        let newPassword = txtNewPassword.text ?? "";
        let confirmPassword = txtConfirmPassword.text ?? "";
        
        let user = Customer.getAuthenticatedUser();
        
        if !oldPassword.isEmpty || !newPassword.isEmpty || !confirmPassword.isEmpty
        {
            if oldPassword.isEmpty
            {
                showError(message: "Enter the old password");
                return;
            }
            
            if newPassword.isEmpty
            {
                showError(message: "Enter the new password");
                return;
            }
            
            if confirmPassword.isEmpty
            {
                showError(message: "Enter the confirmation password");
                return;
            }
            
            if oldPassword != user?.password
            {
                showError(message: "Invalid password");
                return;
            }
            
            if confirmPassword != newPassword
            {
                showError(message: "New password and confirmation doesn't match");
                return;
            }
            
            user?.password = newPassword;
        }
        
        user?.fullName = fullName;
        user?.vehicleNumber = vehicleNumber;
        user?.phoneNumber = phoneNumber;
        
        let alert = UIAlertController(title: "Profile Update", message: "User information successfully updated", preferredStyle: UIAlertControllerStyle.alert);
        let actionOk = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (UIAlertAction) in
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
            let viewController = storyBoard.instantiateViewController(withIdentifier: "MenuVC");
            self.present(viewController, animated: true, completion: nil);
        });
        
        alert.addAction(actionOk);        
        self.present(alert, animated: true, completion: nil);
    }
    
    private func showError(message:String)
    {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertControllerStyle.alert);
        let actionOk = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil);
        alert.addAction(actionOk);
        
        self.present(alert, animated: true, completion: nil);
    }
}

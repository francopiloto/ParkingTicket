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
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        let user = Customer.getAuthenticatedUser();
        
        lblEmail.text = "Email: \(user?.email ?? "")";
        txtFullName.text = user?.fullName;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}

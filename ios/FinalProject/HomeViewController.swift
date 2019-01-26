//
//  HomeViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-22.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
    @IBOutlet weak var lblNumTickets: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        lblNumTickets.text = String(Ticket.numTickets());
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}

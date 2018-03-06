//
//  MenuTableViewController.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-26.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class MenuTableViewController : UITableViewController
{
    var viewName = [
        ["HomeVC", "AddTicketVC", "LocationVC", "ReportVC"],
        ["ProfileVC", "InstructionVC", "ContactVC", "LoginVC"]
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewName.count;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewName[section].count;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil);
        let viewController = storyBoard.instantiateViewController(withIdentifier: viewName[indexPath.section][indexPath.row]);
        self.present(viewController, animated: true, completion: nil);
    }    
}

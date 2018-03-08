//
//  ReportTableViewController.swift
//  FinalProject
//
//  Created by Franco on 3/5/18.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ReportTableViewController: UITableViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad();
        tableView.rowHeight = 200;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Ticket.numTickets();
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketCell", for: indexPath) as! TicketViewCell;
        
        let ticket = Ticket.getTicket(index: indexPath.row);
        cell.imgMakerLogo.image = UIImage(named: ticket.vehicleMaker.lowercased() + ".png");
        
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "  E, d MMM yyyy HH:mm:ss";
        cell.lblTicketDate.text = dateFormatter.string(from: ticket.date);
        cell.lblTicketPrice.text = String(format: "$ %.02f", ticket.price);
        
        cell.lblVehicleNumberValue.text = ticket.vehicleNumber;
        cell.lblVehicleMakerValue.text = ticket.vehicleMaker;
        cell.lblVehicleColorValue.text = ticket.vehicleColor;
        cell.lblParkingInfoValue.text = "\(ticket.parkingTime) \(ticket.parkingLane) \(ticket.parkingSpot)";
        cell.lblPaymentInfoValue.text = ticket.paymentMethod;
        
        return cell
    }   
}

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
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

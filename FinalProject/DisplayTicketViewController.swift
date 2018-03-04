//
//  DisplayTicketViewController.swift
//  FinalProject
//
//  Created by Franco on 3/4/18.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class DisplayTicketViewController: UIViewController
{
    @IBOutlet weak var imgMakerLogo: UIImageView!
    @IBOutlet weak var lblTicketDate: UILabel!
    @IBOutlet weak var lblTicketPrice: UILabel!
    @IBOutlet weak var lblVehicleNumberValue: UILabel!
    @IBOutlet weak var lblVehicleColorValue: UILabel!
    @IBOutlet weak var lblParkingInfoValue: UILabel!
    @IBOutlet weak var lblPaymentInfoValue: UILabel!
    
    var ticket:Ticket?;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        imgMakerLogo.image = UIImage(named: (ticket?.vehicleMaker.lowercased())! + ".png");
        
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "  E, d MMM yyyy HH:mm:ss";
        lblTicketDate.text = dateFormatter.string(from: (ticket?.date)!);
        
        lblTicketPrice.text = String(format: "$ %.02f", (ticket?.price)!);
        lblVehicleNumberValue.text = ticket?.vehicleNumber;
        lblVehicleColorValue.text = ticket?.vehicleColor;
        lblParkingInfoValue.text = "\(ticket?.parkingTime ?? "") \(ticket?.parkingLane ?? "") \(ticket?.parkingSpot ?? "")";
        lblPaymentInfoValue.text = ticket?.paymentMethod;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
}

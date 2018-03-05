//
//  TicketViewCell.swift
//  FinalProject
//
//  Created by MacStudent on 2018-03-05.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class TicketViewCell: UITableViewCell
{
    @IBOutlet weak var imgMakerLogo: UIImageView!
    @IBOutlet weak var lblTicketDate: UILabel!
    @IBOutlet weak var lblTicketPrice: UILabel!
    @IBOutlet weak var lblVehicleNumberValue: UILabel!
    @IBOutlet weak var lblVehicleMakerValue: UILabel!    
    @IBOutlet weak var lblVehicleColorValue: UILabel!
    @IBOutlet weak var lblParkingInfoValue: UILabel!
    @IBOutlet weak var lblPaymentInfoValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

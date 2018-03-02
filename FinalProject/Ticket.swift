//
//  Ticket.swift
//  FinalProject
//
//  Created by MacStudent on 2018-02-27.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class Ticket
{
    var vehicleNumber: String;
    var vehicleBrand: String;
    var vehicleColor: Int;
    var timingPark: Int;
    var lanePark: Int;
    var floorPark: Int;
    var paymentMethod: Int;
    
    init(vehicleNumber: String, vehicleBrand: String,vehicleColor: Int, timingPark: Int, lanePark: Int, floorPark: Int, paymentMethod: Int)
    {
        self.vehicleNumber = vehicleNumber;
        self.vehicleBrand = vehicleBrand;
        self.vehicleColor = vehicleColor;
        self.timingPark = timingPark;
        self.lanePark = lanePark;
        self.floorPark = floorPark;
        self.paymentMethod = paymentMethod;
    }
}

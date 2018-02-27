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
    var vehicleNumber: String
    var vehicleBrand: String
    var vehicleColor: Int
    var timingPark: Int
    var lanePark: Int
    var floorPark: Int
    var paymentMethod: Int

    static var colorList = ["White","Purple", "White Diamond Pearl", " Silver", "Red", "Black", "Grey", "Blue", " Brown"]
    
    static var timingList = ["1/2 Hr.", "1 Hr.", "2 Hr.", "3 Hr.", "Day Ends"]

    static var laneList = ["Lane A", "Lane B","Lane C","Lane D","Lane E"]
    
    static var floorList = ["P1","P2","P3","P4","P5","P6","P7","P8"]
    
    static var paymentList = ["Credit Card", "Debit Card", "Cash"]
    
    init(vehicleNumber: String, vehicleBrand: String,vehicleColor: Int, timingPark: Int, lanePark: Int, floorPark: Int, paymentMethod: Int)
    {
        self.vehicleNumber = vehicleNumber
        self.vehicleBrand = vehicleBrand
        self.vehicleColor = vehicleColor
        self.timingPark = timingPark
        self.lanePark = lanePark
        self.floorPark = floorPark
        self.paymentMethod = paymentMethod
        
        
    }
}

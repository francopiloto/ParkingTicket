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
    var vehicleMaker: String;
    var vehicleColor: String;
    var parkingTime: String;
    var parkingLane: String;
    var parkingSpot: String;
    var paymentMethod: String;
    
    private static var tickets = [Ticket]();
    
    static func addTicket(ticket:Ticket) {
        tickets.append(ticket);
    }
    
    init(vehicleNumber: String, vehicleMaker: String,vehicleColor: String,
         parkingTime: String, parkingLane: String, parkingSpot: String,
         paymentMethod: String)
    {
        self.vehicleNumber = vehicleNumber;
        self.vehicleMaker = vehicleMaker;
        self.vehicleColor = vehicleColor;
        self.parkingTime = parkingTime;
        self.parkingLane = parkingLane;
        self.parkingSpot = parkingSpot;
        self.paymentMethod = paymentMethod;
    }
}

//
//  Customer.swift
//  FinalProject
//
//  Created by Franco on 2/26/18.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class Customer
{
    private var id:Int;
    private var fullName:String;
    private var email:String;
    private var password:String;
    
    private static var customerList = [Int:Customer]();
    
    init(id:Int, fullName:String, email:String, password:String)
    {
        self.id = id;
        self.fullName = fullName;
        self.email = email;
        self.password = password;
    }
    
    func verifyLogin(email:String, password:String) -> Bool {
        return self.email == email && self.password == password;
    }
    
    static func authenticate(email:String, password:String) -> Customer?
    {
        for customer in customerList.values
        {
            if customer.verifyLogin(email: email, password: password) {
                return customer;
            }
        }
        
        return nil;
    }
}

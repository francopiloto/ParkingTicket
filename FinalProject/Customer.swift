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
    var id:Int;
    var fullName:String;
    var email:String;
    var password:String;
    var phoneNumber:String?;
    
    private static var customerList = [Int:Customer]();
    private static var currentUser:Customer?;
    
    private init(id:Int, fullName:String, email:String, password:String)
    {
        self.id = id;
        self.fullName = fullName;
        self.email = email;
        self.password = password;
    }
    
    func verifyLogin(email:String, password:String) -> Bool {
        return self.email == email && self.password == password;
    }
    
    static func createAccount(fullName:String, email:String, password:String) -> Customer?
    {
        for customer in customerList.values
        {
            if customer.email == email {
                return nil;
            }
        }
        
        let customer = Customer(id:customerList.count, fullName:fullName, email:email, password:password);
        customerList[customer.id] = customer;
        
        return customer;
    }
    
    static func authenticate(email:String, password:String) -> Customer?
    {
        for customer in customerList.values
        {
            if customer.verifyLogin(email: email, password: password)
            {
                currentUser = customer;
                return customer;
            }
        }
        
        currentUser = nil;
        return nil;
    }
    
    static func getAuthenticatedUser() -> Customer? {
        return currentUser;
    }
}

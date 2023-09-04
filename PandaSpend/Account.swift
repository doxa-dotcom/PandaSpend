//
//  Account.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-01-22.
//

import Foundation
import Metal

class Account  {
    
    //Properties
    private(set) var transactions = [Transaction]()
    
    var firstName: String
    var lastName: String
    var id = UUID()
    var balance: Double {
        var balance = 0.0
        for transaction in transactions {
            balance += transaction.amount
        }
        return balance
    }
   
    
    //Initialization
    init(firstName: String, lastName:String ) {
        
        self.firstName = firstName
        self.lastName = lastName
       // self.balance = 0.0
        
    }
    
    //Public Methods
    func add(_ transaction: Transaction) {
        transactions.append(transaction)
    }
}

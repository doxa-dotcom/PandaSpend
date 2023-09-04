//
//  Transaction.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-01-22.
//

import Foundation

class Transaction1:  Identifiable, ObservableObject, Codable {
    @Published var id = UUID()
    @Published var description /*: String */= ""
    @Published var accountType /*: String */= ""
    @Published  var category /*: String */= ""//"rent"//Category()
    @Published  var amount /*: Double */= 0.0
    @Published  var date /*:Date */= Date.now
    
   
   
    /*init(description: String, accountType: String, category: String, amount: Double, date: Date ) {
       
        self.description = description
        self.accountType = accountType
        self.category = category
        self.amount = amount
        self.date = Date.now
        
    }*/
    init() { }
    enum CodingKeys: CodingKey {
        case description, accountType, category, amount, date
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(description, forKey: .description)
        try container.encode(accountType, forKey: .accountType)

        try container.encode(category, forKey: .category)
        try container.encode(amount, forKey: .amount)

        try container.encode(date, forKey: .date)
        
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        description = try container.decode(String.self, forKey: .description)
        accountType = try container.decode(String.self, forKey: .accountType)

        category = try container.decode(String.self, forKey: .category)
        amount = try container.decode(Double.self, forKey: .amount)

        date = try container.decode(Date.self, forKey: .date)
       
    }
}

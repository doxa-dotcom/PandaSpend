//
//  TransactionList.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-02-12.
//

import Foundation
class TransactionList: ObservableObject {
    @Published var items = [Transaction1]() {
        didSet{
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
       
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([Transaction1].self, from: savedItems){
                items = decodedItems
                return
            }
        }
        items = []
    }
    
}

//
//  GetBalance.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-02-15.
//

import SwiftUI

struct GetBalance: View {
    
        @FetchRequest var fetchRequest: FetchedResults<Transaction>
   // @State private var balance = 0.0
  private var account : String?
        var body: some View {
            
            HStack {
                Text(account ?? "Personal")
                    .fontWeight(.bold)
                Spacer()
                Text("$\(String(getBalance() ))")
                /* >= 0.0 ? "+$\(String(getBalance() ) )" :"-$\(g
                    .currency(code: Locale.current.currencyCode ?? "CAD"))*/
               

                
            }
            
        }
        
    init( filter : String) {
       // let newfilter = filter
            if (filter.isEmpty){
                _fetchRequest = FetchRequest<Transaction>(sortDescriptors: [])//, predicate: NSPredicate(format: "account == %@", filter))
                
            }
            else{
                _fetchRequest = FetchRequest<Transaction>(sortDescriptors: [], predicate: NSPredicate(format: "account == %@", filter))

            }
       // print("filter: \(filter) ")
        self.account = filter
        print("account: \(account ?? "none") ")

        }
    
    func getBalance() -> Double{
        var balance = 0.0
        for transaction in fetchRequest {
            //if (transaction.category == income
              balance += transaction.amount
        }
        return balance
    }
    }


/*struct GetBalance_Previews: PreviewProvider {
    static var previews: some View {
        GetBalance()
    }
}*/

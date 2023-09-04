//
//  TransactionRows.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-02-01.
//

import SwiftUI

struct TransactionRows: View {
    public var category: String
    public var amount: Double
    public var date: Date
    var body: some View {
        VStack {
            HStack {
               
                Text(date, style: .date).font(.callout)
                
                Spacer()
                
            }
        HStack {
            //var amount = ""
           // if (category == "Income"){
               // amount = "+" + amount
                Text(category).font(.title3)
                    
                Spacer()
                
                Text("$" + String(amount))
                    .fontWeight(.bold)
           // }
           /* else {
               // amount = "-" + amount
                Text(category).font(.title3)
                    
                Spacer()
                Text("-$" + String(amount))
                    .fontWeight(.bold)
                
            }*/
           
            
        }//.padding([.horizontal,.bottom])
           // .padding(.bottom,10)
            
    } /*.frame(maxWidth: .infinity)
            .background(Color.white)*/
        
    }
}

struct TransactionRows_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRows(category: "Income",
                        amount: 200.0,
                        date: Date.now
        )
    }
}

//
//  Home.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-01-21.
//

import SwiftUI

struct Home: View {
    
    /*@State var*/let categoryList: [String] = ["Income","Entertainment","Food","Rent&Bills","Travel","Transport","Sport","Transfer","Materialistic", "Desire","Cash Withdrawal","Gifts","Groceries","Personal care","Other"]
   
    var body: some View {
        ZStack() {
            Color("AccentColor").edgesIgnoringSafeArea(.all)
            List {
                Text("Welcome, User")
                    .font(.title)
                    .fontWeight(.bold)
                Section ("Balance"){
            //    VStack(spacing:15){
                Text(Date(), style: .date)
                   
                 /*   HStack {
                        Text("Personal")
                            .fontWeight(.bold)
                        Spacer()
                        
                        Text("$200")
                        
                    }
                    HStack {
                        Text("Business")
                            .fontWeight(.bold)
                        Spacer()
                        Text("$200")
                        
                    }*/
                    
                  GetBalance(filter: "Personal")
                GetBalance(filter: "Business")
              //  }.padding([.horizontal,.bottom])
                //    .padding(.bottom,10)
               //     .frame(maxWidth: .infinity)
                 //   .background(Color.white)
            }
                Section ("Latest Transactions"){}
             /* //  VStack(spacing:15){
                 //   Text("Latest Transacions")
                 //   ScrollView(.vertical, showsIndicators: false){
                      //  VStack(spacing:10){
                            ForEach(categoryList, id: \.self ){category in
                                
                                TransactionRows(category: category,
                                                amount: 200.0,
                                                date: Date.now
                                )
                                
                            }
                   // FilteredList(filter: "Business")
                    //    }
                   // }
                 //   Spacer()
            //    }//.background(Color(hue: 1.0, saturation: 0.031, brightness: 0.79))
            }*/
               // Section("Ball"){
           //     FilteredList(filter: "")
           // }
                
            }
           /* VStack(spacing:15) {
                Text("Welcome, User")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(spacing:15){
                    Text(Date(), style: .date)
                    HStack {
                        Text("Income")
                            .fontWeight(.bold)
                        Spacer()
                        Text("$200")
                        
                    }
                    HStack {
                        Text("Expense")
                            .fontWeight(.bold)
                        Spacer()
                        Text("$200")
                        
                    }
                    
                    HStack {
                        Text("Balance")
                            .fontWeight(.bold)
                        Spacer()
                        Text("$200")
                    }
                }.padding([.horizontal,.bottom])
                    .padding(.bottom,10)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                
                
                VStack(spacing:15){
                    Text("Latest Transacions")
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing:10){
                            ForEach(categoryList, id: \.self ){category in
                                
                                TransactionRows(category: category,
                                                amount: "200",
                                                date: Date.now
                                )
                                
                            }
                        }
                    }
                    Spacer()
                }//.background(Color(hue: 1.0, saturation: 0.031, brightness: 0.79))
                
            }*/
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}



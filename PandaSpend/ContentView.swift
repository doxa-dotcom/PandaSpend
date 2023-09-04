//
//  ContentView.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-01-21.
//

import SwiftUI


struct ContentView: View {
    
    //@Environment(\.managedObjectContext) var moc
    //Fetch data from CoreDate
    // @FetchRequest(sortDescriptors: []) var trans: FetchedResults<Transaction>
    @State var categoryList: [String] = ["Income","Entertainment","Food","Rent&Bills","Travel","Transport","Sport","Transfer","Materialistic", "Desire","Cash Withdrawal","Gifts","Groceries","Personal care","Other"]
    
   /* @State var selectedTab: String = "Personal"
    @State private var selection = 0
    let types: [String] = ["Personal","Business"]*/
    
    var body: some View {
        
      //  VStack(spacing:15){
         //   Text("Transactions").font(.title)
            
            //account type tab
           /* ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 18){
                    ForEach(types, id: \.self){
                        
                        AccountTypeView(type: $0)
                        
                    }
                }.padding(.horizontal,25)
                    
                
            }.onChange(of: selectedTab){ newValue in
                print("selectedTab is \(selectedTab)")
                print("newvalue is \(newValue)")
               // categoryList = ["business","business","business"]
            }*/
            //transaction pages
           /* ScrollView(.horizontal, showsIndicators: false){
                VStack(spacing: 25){
                    ForEach(categoryList, id: \.self){category in
                        Text(category)
                    }
                }
            }
            Spacer()
        }*/
        /* Text("Hello, world!")
         .padding()*/
      //   AddTransaction()
     //  testing()
       
     //   Chart2()
       // Home()
      //  CalenderView()
         Transactions()
     //   MainPage()
    //    MonthYearPickerView(start: 2018, end: 2022)
        /*  VStack {
         List(trans) { transa in
         Text(transa.name ?? "Unknown")
         }
         
         Button("Add"){
         let name = ["Loyer", "Gas", "paye"]
         let amount = [100.0, 200.0,400.0,1000.0]
         let acc = ["Personal", "Business"]
         let cat = ["Rent", "Transport","Income"]
         
         let chosenName = name.randomElement()!
         let chosenAmount = amount.randomElement()!
         let chosenAcc = acc.randomElement()!
         let chosenCat = cat.randomElement()!
         
         let transact = Transaction(context: moc)
         
         transact.id =  UUID()
         transact.name = chosenName
         transact.amount = chosenAmount
         transact.category = chosenCat
         transact.account = chosenAcc
         transact.date = Date.now
         
         try? moc.save()
         }
         }*/
        
        /* TabView {
         Text("First")
         Text("Second")
         Text("Third")
         Text("Fourth")
         }
         .tabViewStyle(.page)*/
  //  }
    
   /* func nameChanged(to value: String) {
            print("Name changed to \(selectedTab)!")
        }
    
    @ViewBuilder
    func TransactionListView(transaction: String)-> some View{
        VStack(spacing: 10){
            
        }
    }
    
    @ViewBuilder
    func AccountTypeView(type:String)-> some View{
        Button{
            //update current tab
            withAnimation{
                
                selectedTab = type
            }
            
        }label: {
            Text(type)
            //.font(.custom(<#T##name: String##String#>, size: ))
                .font(.system(size: 15))
                .fontWeight(.semibold)
            //changing color based on current tab
                .foregroundColor(selectedTab == type ?
                                 Color.black :
                                    Color.black.opacity(0.3))
                .padding(.bottom,10)
            //adding indicator at the bottom
                .overlay(
                    ZStack{
                        if selectedTab == type{
                            Capsule()
                                .fill(Color.black)
                                .frame(height: 2)
                        }
                    }
                        .padding(.horizontal,-5)
                    ,alignment: .bottom
                )
        }*/
    }
    
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

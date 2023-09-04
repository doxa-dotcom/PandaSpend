//
//  TransactionsDetails.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-02-01.
//

import SwiftUI

struct Transactions: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date, order: .reverse)],
                  predicate: NSPredicate(format: "account == %@", "Business"))  var transactionsPersonal: FetchedResults<Transaction>
   /* @State var categoryList: [String] = ["Income","Entertainment","Food","Rent&Bills","Travel","Transport","Sport","Transfer","Materialistic", "Desire","Cash Withdrawal","Gifts","Groceries","Personal care","Other"]*/
   // @StateObject var transactionsPersonal = TransactionList()
    //@StateObject var transactionsBusiness = TransactionList()
    @State private var showingAddScreen = false
    @State var selectedTab: String = "Personal"
    @State private var selection = 0
    let types: [String] = ["Personal","Business"]
    
   
    @State private var selectedMonth: Int = Calendar.current.component(.month, from: Date()) - 1
   /* init(month: Binding<Date>) {

            // self.$amount = amount // beta 3
            self._selectedMonth = month // beta 4
        }*/
    var body: some View {
        VStack(spacing:15){
            Text("Transactions").font(.title)
            //if transactionsPersonal.items.count >= 1{
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 18){
                    ForEach(types, id: \.self){
                        
                        AccountTypeView(type: $0)
                        
                    }
                }.padding(.horizontal,25)
                    
                
            }.onChange(of: selectedTab){ newValue in
                print("selectedTab is \(selectedTab)")
                print("newvalue is \(newValue)")
               // categoryList = ["business","business","business"]
            }
            MonthYearPickerView(start: 2017, end: Calendar.current.component(.year, from: Date()), selectedMonth: $selectedMonth)
           /* Section{
                DatePicker("Date", selection: $selectedMonth,in: ...Date(), displayedComponents: .year,.month)
                
            }*/
            FilteredList(filter: selectedTab)
           /* if transactionsPersonal.count >= 1{
                List {//ScrollView(.vertical, showsIndicators: false){
                    LazyVStack(spacing:10){
                        ForEach(transactionsPersonal/*.items, id: \.self*/ ){item in
                            
                            TransactionRows(category: item.category ?? "Other",
                                            amount: item.amount,
                                            date: item.date ?? Date.now
                            )
                            
                        }//.onDelete(perform: removeRows)
                        
                    }
                    //   }
                }*/
                /* ScrollView(.vertical, showsIndicators: false){
                 VStack(spacing:10){
                 ForEach(categoryList, id: \.self ){category in
                 
                 TransactionRows(category: category,
                 amount: "200",
                 date: Date.now
                 )
                 
                 }
                 }
                 }*/
            /*}
            else{
                Spacer()
            }*/
            Button(action: {
                //do something when buttom is tapped
                showingAddScreen.toggle()
                
            }) {
                HStack {
                    Image(systemName: "plus")
                        .font(.title)
                    Text("add transaction")
                        .fontWeight(.semibold)
                        .font(.title2)
                }.sheet(isPresented: $showingAddScreen) {
                    // contents of the sheet
                    AddTransaction(/*transactionsPersonal : transactionsPersonal,
                                   transactionsBusiness : transactionsBusiness*/)
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.black)
                .cornerRadius(40)
            }
        }
    }
    
   /* func removeRows(at offsets: IndexSet) {
        categoryList.remove(atOffsets: offsets)
    }*/
    func nameChanged(to value: String) {
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
        }
    }
}

struct Transactions_Previews: PreviewProvider {
    static var previews: some View {
        Transactions()
    }
}

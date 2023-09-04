//
//  AddTransaction.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-02-05.
//

import SwiftUI

struct AddTransaction: View {
    @Environment(\.managedObjectContext) var moc
  //  @FetchRequest(sortDescriptors: []) var transactionsPersonal:FetchedResults<Transaction>
    
     @State private var name = ""
     @State private var amount = 0.0
     @State private var selectedDate = Date()
     @State private var selectedCategory = ""
     @State private var selectedAcc = ""
    /* @StateObject*/
   // @ObservedObject var transactionsPersonal = TransactionList()
  //  @ObservedObject var transactionsBusiness = TransactionList()
  //  @StateObject var transaction = Transaction()
    
    let types: [String] = ["Personal","Business"]
    //@FocusState private var amountIsFocused : Bool
    let categoryList: [String] = ["Income","Entertainment","Food","Rent&Bills","Travel","Transport","Sport","Transfer","Materialistic", "Desire","Cash Withdrawal","Gifts","Groceries","Personal care","Other"]
    
    @State private var showingAlert = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section{
                    TextField("Description", text: $name )
                    
                    HStack{
                        //Text("Amount")
                        TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "CAD"))
                            .keyboardType(.decimalPad)
                        // .focused($amountIsFocused)
                        
                        //.multilineTextAlignment(.trailing)
                        
                    }
                    
                }
                Section{
                    Picker("Account Type", selection: $selectedAcc ){
                        ForEach (types, id:  \.self){
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                }header: {
                    Text("Account Type")
                }
                Section{
                    Picker("Category", selection: $selectedCategory ){
                        ForEach (categoryList, id:  \.self){
                            Text($0)
                        }
                    }
                    
                }
                
                Section{
                    DatePicker("Date", selection: $selectedDate,in: ...Date(), displayedComponents: .date)
                    
                }
                
                
                //  }
                
                /*Section{
                 
                 Button(action: {
                 print("Delete tapped!")
                 }) {
                 HStack {
                 Image(systemName: "plus")
                 .font(.title)
                 Text("add")
                 .fontWeight(.semibold)
                 .font(.title2)
                 }
                 .padding()
                 .foregroundColor(.white)
                 .background(Color.black)
                 .cornerRadius(40)
                 }
                 
                 
                 }*/
            }.navigationTitle("New Transaction")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button("Save") {
                            //date print one date in advance
                          //  print("here is the data \(transaction.date)" )
                            showingAlert = true
                            let trans = Transaction(context: moc)
                            trans.id = UUID()
                            trans.name = name
                            trans.account = selectedAcc
                            trans.category = selectedCategory
                            if (selectedCategory == "Income"){
                                trans.amount = amount
                                
                            }
                            else {
                                trans.amount = -amount
                            }
                           /* let day = selectedDate
                            let calendar = Calendar.current
                            let components = calendar.dateComponents([.day], from: day)
                            let dayOfMonth = components.day*/
                            trans.date = selectedDate
                            print("its here\(trans.description) and date:\(trans.date!)")
                          /*  if transaction.accountType == "Personal"{
                                transactionsPersonal.items.append(transaction)
                            }
                            else {
                                transactionsBusiness.items.append(transaction)}*/
                            if moc.hasChanges {
                                try? moc.save()
                            }
                        }.foregroundColor(.blue)
                            .alert("Transaction added", isPresented: $showingAlert){
                                Button("OK"){
                                    dismiss()
                                }
                            }
                        
                    }
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }.foregroundColor(.blue)
                    }
                }
            /*.toolbar {
             ToolbarItemGroup(placement: .keyboard) {
             Button("Done") {
             amountIsFocused = false
             }
             }
             }*/
        }
    }
}

struct AddTransaction_Previews: PreviewProvider {
    static var previews: some View {
        AddTransaction(/*transactionsPersonal : TransactionList(),
                       transactionsBusiness : TransactionList()*/)
    }
}

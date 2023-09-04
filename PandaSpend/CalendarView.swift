//
//  Calender.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-02-17.
//

import SwiftUI

struct CalenderView: View {
    @State private var selectedDate=Date()
    @Environment(\.managedObjectContext) var moc
    @State private var date = Date()
    /*@SectionedFetchRequest private var mySections: SectionedFetchResults<String, Transaction>*/
    @SectionedFetchRequest<Date, Transaction>( // Here we use SectionedFetchRequest
        sectionIdentifier: \.date!, // Add this line
        sortDescriptors: [
            SortDescriptor(\.date, order: .forward)
        ])
    private var transactions: SectionedFetchResults <Date, Transaction>
    
    var body: some View {
        
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
            DatePicker("Transaction date",selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(.graphical)
               /* .onChange(of: selectedDate){ newValue in
                   print("selecteddate \(selectedDate)")*/
                    
                    List {
                        
                        ForEach(transactions) { section in
                            
                            //let day = transactions[0]
                            // let t = type(of: section.id)
                            // Text("Section \((section.id).formatDate()) has \(section.count) elements")
                            // }
                            /* let formatter1 = DateFormatter()*/
                            //formatter1.dateStyle = .short
                            /*Text("here \(formatter1.string(from: day))")*/
                            // print(formatter1.string(from: day))
                            Section(header: Text("\((section.id).formatDate(format: "EEEE, MMM dd"))")) { //section' id is a date object
                                let diff = Calendar.current.dateComponents([.day], from: section.id, to: selectedDate)
                        //        print("selecteddate \(section.id)")
                             //   if diff.day == 0 {
                                    ForEach(section) { transaction in
                                        VStack{
                                            Text("Name: \(transaction.name ?? "No name")") // Just an example
                                            Text("Account: \(transaction.account ?? "No name")")
                                            Text("Category: \(transaction.category ?? "No name")")
                                            Text("Amount: $\(String(transaction.amount))")
                                        }
                                        
                                    }
                               // } else {

                                //    Text("No Transaction found")
                                    //print("selecteddate \(section.id)")
                              //  }
                                
                            }
                        }
                    }
              //  }
            
            Spacer()
        }
    }
}

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}

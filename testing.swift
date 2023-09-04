//
//  testing.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-02-15.
//

import SwiftUI
extension Date {
    func formatDate(format: String) -> String {
                    let dateFormatter = DateFormatter()
              //  dateFormatter.setLocalizedDateFormatFromTemplate("EEEE, MMM d")
                //return dateFormatter.string(from: self)
        // Create String
    //    let string = " 29 October 2019 20:15:55 +0200"

        // Create Date Formatter
        //let dateFormatter = DateFormatter()

        // Set Date Format
        dateFormatter.dateFormat = format

        // Convert String to Date
       return dateFormatter.string(from: self) // Oct 29, 2019 at 7:15 PM            }
}
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
            return calendar.component(component, from: self)
        }
}

struct testing: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var date = Date()
    /*@SectionedFetchRequest private var mySections: SectionedFetchResults<String, Transaction>*/
    @SectionedFetchRequest<Date, Transaction>( // Here we use SectionedFetchRequest
      sectionIdentifier: \.date!, // Add this line
      sortDescriptors: [
        SortDescriptor(\.date, order: .forward)
      ])
    private var transactions: SectionedFetchResults <Date, Transaction>
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date, order: .reverse)],
                  predicate: NSPredicate(format: "account == %@", "Business"))  var transactionsPersonal: FetchedResults<Transaction>
    
    var body: some View {
        
      /*  Text(Date.now , style:.date)
                .font(.title)
        Section("Ball"){
        FilteredList(filter: "")
    }*/
        VStack{
            Text("Title")
        List {
                ForEach(transactions) { section in
                   // let t = type(of: section.id)
                   // Text("Section \((section.id).formatDate()) has \(section.count) elements")
                   // }
                   /* let formatter1 = DateFormatter()*/
                    //formatter1.dateStyle = .short
                    /*Text("here \(formatter1.string(from: day))")*/
                   // print(formatter1.string(from: day))
                    Section(header: Text("\((section.id).formatDate(format: "EEEE, MMM dd"))")) { //section' id is a date object
                     //  Text("")
                        ForEach(section) { transaction in
                            VStack{
                            Text("Name: \(transaction.name ?? "No name")") // Just an example
                               /* Text("Account: \(transaction.account ?? "No name")")
                                Text("Category: \(transaction.category ?? "No name")")
                                Text("Amount: $\(String(transaction.amount))")*/
                            }
                            
                        }
                    }
                }
        }}
    }
}

struct testing_Previews: PreviewProvider {
    static var previews: some View {
        testing()
    }
}

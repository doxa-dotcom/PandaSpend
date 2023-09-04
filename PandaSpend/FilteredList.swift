//
//  FilteredList.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-02-15.
//

import SwiftUI
import CoreData

struct FilteredList: View {
    @FetchRequest var fetchRequest: FetchedResults<Transaction>
    var body: some View {
        
       /* List(fetchRequest, id: \.self) { singer in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }*/
        
        List {//ScrollView(.vertical, showsIndicators: false){
            LazyVStack(spacing:10){
                ForEach(fetchRequest/*.items, id: \.self*/ ){item in
                   
                    TransactionRows(category: item.category ?? "Other",
                                    amount: item.amount,
                                    date: item.date ?? Date.now
                    )
                    
                }//.onDelete(perform: removeRows)
                
            }
            //   }
        }
    }
    
    init(filter: String) {
        
        if (filter.isEmpty){
            _fetchRequest = FetchRequest<Transaction>(sortDescriptors: [SortDescriptor(\.date, order: .reverse)], predicate: NSPredicate(format: "account IN %@", ["Personal", "Business"]))
            print(fetchRequest.endIndex)
        }
        else{
            _fetchRequest = FetchRequest<Transaction>(sortDescriptors: [SortDescriptor(\.date, order: .reverse)], predicate: NSPredicate(format: "account == %@", filter))
            print("\(filter): \( fetchRequest.endIndex )")        }
    }
    
}

/*struct FilteredList_Previews: PreviewProvider {
    static var previews: some View {
        FilteredList()
    }
}*/

//
//  DataController.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-02-03.
//

import SwiftUI
import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Transaction")
    
    init(){
        container.loadPersistentStores {
            description, error in
            if let error = error {
                print("Core Data failed to load:\(error.localizedDescription)")
                
            }
        }
    }
   
}

/*struct DataController_Previews: PreviewProvider {
    static var previews: some View {
        DataController()
    }
}*/

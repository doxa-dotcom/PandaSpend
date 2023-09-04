//
//  PandaSpendApp.swift
//  PandaSpend
//
//  Created by doxa boukaka on 2022-01-21.
//

import SwiftUI

@main
struct PandaSpendApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

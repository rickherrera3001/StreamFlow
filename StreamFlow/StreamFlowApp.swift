//
//  StreamFlowApp.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.
//

import SwiftUI

@main
struct StreamFlowApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

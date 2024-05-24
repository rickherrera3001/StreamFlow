//
//  StreamFlowApp.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.
//

import SwiftUI
import FirebaseCore

@main
struct StreamFlowApp: App {
    @StateObject private var loginViewModel = LoginViewViewModel()

    let persistenceController = PersistenceController.shared
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(loginViewModel)
        }
    }
}

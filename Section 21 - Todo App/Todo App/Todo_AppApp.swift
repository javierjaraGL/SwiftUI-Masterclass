//
//  Todo_AppApp.swift
//  Todo App
//
//  Created by Javier Jara Montoya on 23/9/25.
//

import SwiftUI

@main
struct Todo_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

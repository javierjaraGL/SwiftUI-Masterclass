//
//  Learn_by_DoingApp.swift
//  Learn by Doing
//
//  Created by Javier Jara Montoya on 22/9/25.
//

import SwiftUI

@main
struct Learn_by_DoingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

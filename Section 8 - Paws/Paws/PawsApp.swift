//
//  PawsApp.swift
//  Paws
//
//  Created by Javier Jara Montoya on 10/9/25.
//

import SwiftUI
import SwiftData

@main
struct PawsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Pet.self)
        }
    }
}

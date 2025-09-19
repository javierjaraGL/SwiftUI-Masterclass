//
//  Grocery_ListApp.swift
//  Grocery List
//
//  Created by Javier Jara Montoya on 9/9/25.
//

import SwiftUI
import SwiftData

@main
struct Grocery_ListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Item.self)
        }
    }
}

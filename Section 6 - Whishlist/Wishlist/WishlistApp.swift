//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Javier Jara Montoya on 9/9/25.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Wish.self)
        }
    }
}

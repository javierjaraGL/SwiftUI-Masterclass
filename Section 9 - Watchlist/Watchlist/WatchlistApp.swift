//
//  WatchlistApp.swift
//  Watchlist
//
//  Created by Javier Jara Montoya on 10/9/25.
//

import SwiftUI
import SwiftData

@main
struct WatchlistApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().modelContainer(for: Movie.self)
        }
    }
}

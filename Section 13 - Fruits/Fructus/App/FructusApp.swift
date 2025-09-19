//
//  FructusApp.swift
//  Fructus
//
//  Created by Javier Jara Montoya on 16/9/25.
//

import SwiftUI

@main
struct FructusApp: App {
    @AppStorage("isOnboarding") var isOnboarding : Bool = true

    var body: some Scene {
        WindowGroup {
            if isOnboarding {
                  OnboardingView()
                } else {
                  ContentView()
                }
        }
    }
}

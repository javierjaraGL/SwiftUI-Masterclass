//
//  ContentView.swift
//  Restart
//
//  Created by Javier Jara Montoya on 12/9/25.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
  @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
  
  var body: some View {
    ZStack {
      if isOnboardingViewActive {
        OnboardingView()
      } else {
        HomeView()
      }
    }
  }
}

#Preview {
    ContentView()
}

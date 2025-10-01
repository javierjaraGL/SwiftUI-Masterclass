//
//  ContentView.swift
//  Learn By Doing
//
//  Created by Javier Jara Montoya on 22/9/25.
//

import SwiftUI 

struct ContentView: View {
  // MARK: - PROPERTIES
  
  var cards: [Card] = cardData
  
  // MARK: - CONTENT
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 20) {
        ForEach(cards) { item in
          CardView(card: item)
        }
      }
      .padding(20)
    }
  }
}

// MARK: - PREVIEW

#Preview {
    ContentView()
}


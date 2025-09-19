//
//  ContentView.swift
//  Fructus
//
//  Created by Javier Jara Montoya on 16/9/25.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  
  @State private var isShowingSettings: Bool = false
  
  var fruits: [Fruit] = fruitsData

  // MARK: - BODY

  var body: some View {
    NavigationView {
      List {
        ForEach(fruits.shuffled()) { item in
          NavigationLink(destination: FruitDetailView(fruit: item)) {
            FruitRowView(fruit: item)
              .padding(.vertical, 4)
          }
        }
      }
      .navigationTitle("Fruits")
      .navigationBarItems(
        trailing:
          Button(action: {
            isShowingSettings = true
          }) {
            Image(systemName: "slider.horizontal.3")
          } //: BUTTON
          .sheet(isPresented: $isShowingSettings) {
            SettingsView()
          }
      )
    } //: NAVIGATION
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

#Preview {
    ContentView(fruits: fruitsData)
}

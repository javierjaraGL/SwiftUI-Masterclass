//
//  OnboardingView.swift
//  Fructus
//
//  Created by Javier Jara Montoya on 17/9/25.
//

import SwiftUI

struct OnboardingView: View {
  // MARK: - PROPERTIES
  
  var fruits: [Fruit] = fruitsData
  
  // MARK: - BODY
  
  var body: some View {
    TabView {
      ForEach(fruits[0...5]) { item in
        FruitCardView(fruit: item)
      } //: LOOP
    } //: TAB
    .tabViewStyle(PageTabViewStyle())
    .padding(.vertical, 20)
  }
}


#Preview {
    OnboardingView(fruits: fruitsData)
}

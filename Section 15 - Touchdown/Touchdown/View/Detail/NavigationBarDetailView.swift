//
//  NavigationBarDetailView.swift
//  Touchdown
//
//  Created by Javier Jara Montoya on 19/9/25.
//

import SwiftUI

struct NavigationBarDetailView: View {
  // MARK: - PROPERTY
  
  @EnvironmentObject var shop: Shop
    
  // MARK: - BODY
  
  var body: some View {
    HStack {
      Button(action: {
        withAnimation(.easeIn) {
          feedback.impactOccurred()
          shop.selectedProduct = nil
          shop.showingProduct = false
        }
      }, label: {
        Image(systemName: "chevron.left")
          .font(.title)
          .foregroundColor(.white)
      })
      
      Spacer()
      
      Button(action: {}, label: {
        Image(systemName: "cart")
          .font(.title)
          .foregroundColor(.white)
      })
    } //: HSTACK
  }
}

#Preview {
    NavigationBarDetailView()
        .environmentObject(Shop())
        .preferredColorScheme(.dark)
}

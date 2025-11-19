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
      
      Button(action: {
        withAnimation(.easeIn) {
          feedback.impactOccurred()
          shop.showingCart = true
        }
      }, label: {
        ZStack(alignment: .topTrailing) {
          Image(systemName: "cart")
            .font(.title)
            .foregroundColor(.white)
          
          // Badge
          if shop.cart.products.count > 0 {
            Text("\(shop.cart.products.count)")
              .font(.caption2)
              .fontWeight(.bold)
              .foregroundColor(.white)
              .frame(minWidth: 16, minHeight: 16)
              .background(Color.red)
              .clipShape(Circle())
              .offset(x: 8, y: -8)
          }
        } //: ZSTACK
      })
      .sheet(isPresented: $shop.showingCart) {
        CartView()
          .environmentObject(shop)
      }
    } //: HSTACK
  }
}

#Preview {
    NavigationBarDetailView()
        .environmentObject(Shop())
        .preferredColorScheme(.dark)
}

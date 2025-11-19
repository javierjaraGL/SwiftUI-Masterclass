//
//  NavigationBarView.swift
//  Touchdown
//
//  Created by Javier Jara Montoya on 19/9/25.
//

import SwiftUI

struct NavigationBarView: View {
  // MARK: - PROPERTY
  
  @EnvironmentObject var shop: Shop
  @State private var isAnimated: Bool = false
  
  // MARK: - BODY
  
  var body: some View {
    HStack {
      Button(action: {}, label: {
        Image(systemName: "magnifyingglass")
          .font(.title)
          .foregroundColor(.black)
      }) //: BUTTON
      
      Spacer()
      
      LogoView()
        .opacity(isAnimated ? 1 : 0)
        .offset(x: 0, y: isAnimated ? 0 : -25)
        .onAppear(perform: {
          withAnimation(.easeOut(duration: 0.5)) {
            isAnimated.toggle()
          }
        })
      
      Spacer()
      
      Button(action: {
        feedback.impactOccurred()
        shop.showingCart = true
      }, label: {
        ZStack(alignment: .topTrailing) {
          Image(systemName: "cart")
            .font(.title)
            .foregroundColor(.black)
          
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
      }) //: BUTTON
      .sheet(isPresented: $shop.showingCart) {
        CartView()
          .environmentObject(shop)
      }
    } //: HSTACK
  }
}
#Preview {
    NavigationBarView()
        .environmentObject(Shop())
}

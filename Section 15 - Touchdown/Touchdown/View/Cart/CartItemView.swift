//
//  CartItemView.swift
//  Touchdown
//
//  Created by Javier Jara Montoya on 22/10/25.
//

import SwiftUI

struct CartItemView: View {
  // MARK: - PROPERTY
  
  let product: Product
  
  // MARK: - BODY
  
  var body: some View {
    HStack(spacing: 15) {
      // PRODUCT IMAGE
      ZStack {
        Image(product.image)
          .resizable()
          .scaledToFit()
          .padding(10)
      } //: ZSTACK
      .frame(width: 80, height: 80)
      .background(Color(red: product.red, green: product.green, blue: product.blue))
      .cornerRadius(12)
      
      // PRODUCT INFO
      VStack(alignment: .leading, spacing: 5) {
        Text(product.name)
          .font(.headline)
          .fontWeight(.bold)
          .lineLimit(2)
        
        Text(product.formattedPrice)
          .font(.subheadline)
          .fontWeight(.semibold)
          .foregroundColor(.gray)
      } //: VSTACK
      
      Spacer()
    } //: HSTACK
    .padding()
    .background(Color.white)
    .cornerRadius(12)
    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
  }
}

#Preview {
  CartItemView(product: products[0])
    .padding()
    .background(colorBackground)
}


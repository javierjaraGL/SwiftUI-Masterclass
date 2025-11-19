//
//  CartPreview.swift
//  Touchdown
//
//  Created by Javier Jara Montoya on 22/10/25.
//

import SwiftUI

struct CartPreview: View {
  @StateObject var shop = Shop()
  
  var body: some View {
    CartView()
      .environmentObject(shop)
      .onAppear {
        // Add some sample products to the cart for preview
        shop.cart.products = [products[0], products[1], products[2]]
        shop.cart.tax = 0
        shop.cart.shipping = 0
      }
  }
}

#Preview {
  CartPreview()
}


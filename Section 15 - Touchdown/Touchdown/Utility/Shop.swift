//
//  Shop.swift
//  Touchdown
//
//  Created by Javier Jara Montoya on 19/9/25.
//

import Foundation

class Shop: ObservableObject {
  @Published var showingProduct: Bool = false
  @Published var selectedProduct: Product? //= nil
  @Published var showingCart: Bool = false
  @Published var cart: Cart = Cart()
}

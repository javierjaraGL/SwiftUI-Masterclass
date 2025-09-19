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
}

//
//  CartModel.swift
//  Touchdown
//
//  Created by Javier Jara Montoya on 22/10/25.
//

import Foundation

struct Cart: Codable, Identifiable {
  let id: UUID
  var products: [Product]
  var tax: Int = 0
  var shipping: Int = 0
  
  var subtotal: Int {
    return products.reduce(0) { $0 + $1.price }
  }
  
  var total: Int {
    return subtotal + tax + shipping
  }
  
  var formattedSubtotal: String { return "$\(subtotal)" }
  var formattedTax: String { return "$\(tax)" }
  var formattedShipping: String { return "$\(shipping)" }
  var formattedTotal: String { return "$\(total)" }
  
  init(id: UUID = UUID(), products: [Product] = [], tax: Int = 0, shipping: Int = 0) {
    self.id = id
    self.products = products
    self.tax = tax
    self.shipping = shipping
  }
}


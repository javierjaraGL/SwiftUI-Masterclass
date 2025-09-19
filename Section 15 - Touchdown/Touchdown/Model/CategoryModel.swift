//
//  CategoryModel.swift
//  Touchdown
//
//  Created by Javier Jara Montoya on 19/9/25.
//

import Foundation

struct Category: Codable, Identifiable {
  let id: Int
  let name: String
  let image: String
}

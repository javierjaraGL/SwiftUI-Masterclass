//
//  AnimalModel.swift
//  Africa
//
//  Created by Javier Jara Montoya on 18/9/25.
//

import SwiftUI

struct Animal: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let fact: [String]
}

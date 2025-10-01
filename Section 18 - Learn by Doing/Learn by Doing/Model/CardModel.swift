//
//  Card.swift
//  Learn By Doing
//
//  Created by Javier Jara Montoya on 22/9/25.


import SwiftUI

// MARK: - CARD MODEL

struct Card: Identifiable {
  var id = UUID()
  var title: String
  var headline: String
  var imageName: String
  var callToAction: String
  var message: String
  var gradientColors: [Color]
}

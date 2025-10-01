//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Javier Jara Montoya on 24/9/25.
//


import SwiftUI

struct TitleModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.largeTitle)
      .foregroundColor(Color.pink)
  }
}

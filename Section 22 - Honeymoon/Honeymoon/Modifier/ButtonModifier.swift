//
//  ButtonModifier.swift
//  Honeymoon
//
//  Created by Javier Jara Montoya on 24/9/25.
//


import SwiftUI

struct ButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.headline)
      .padding()
      .frame(minWidth: 0, maxWidth: .infinity)
      .background(Capsule().fill(Color.pink))
      .foregroundColor(Color.white)
  }
}

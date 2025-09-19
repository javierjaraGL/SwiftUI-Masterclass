//
//  CenterModifier.swift
//  Africa
//
//  Created by Javier Jara Montoya on 18/9/25.
//

import SwiftUI

struct CenterModifier: ViewModifier {
  func body(content: Content) -> some View {
    HStack {
      Spacer()
      content
      Spacer()
    }
  }
}

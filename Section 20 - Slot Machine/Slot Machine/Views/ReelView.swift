//
//  ReelView.swift
//  Slot Machine
//
//  Created by Javier Jara Montoya on 23/9/25.
//

import SwiftUI

import SwiftUI

struct ReelView: View {
  var body: some View {
    Image("gfx-reel")
      .resizable()
      .modifier(ImageModifier())
  }
}

#Preview {
    ReelView()
}

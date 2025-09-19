//
//  BackgroundImageView.swift
//  Devote
//
//  Created by Javier Jara Montoya on 19/9/25.
//

import SwiftUI

struct BackgroundImageView: View {
  var body: some View {
    Image("rocket")
      .antialiased(true)
      .resizable()
      .scaledToFill()
      .ignoresSafeArea(.all)
  }
}

#Preview {
    BackgroundImageView()
}

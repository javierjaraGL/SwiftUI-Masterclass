//
//  ControlImageView.swift
//  Pinch
//
//  Created by Javier Jara Montoya on 16/9/25.
//

import SwiftUI

struct ControlImageView: View {
  let icon: String
  
  var body: some View {
    Image(systemName: icon)
      .font(.system(size: 36))
  }
}

#Preview {
    ControlImageView(icon: "minus.magnifyingglass")
          .preferredColorScheme(.dark)
          .padding()
}

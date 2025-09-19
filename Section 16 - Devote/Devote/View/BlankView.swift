//
//  BlankView.swift
//  Devote
//
//  Created by Javier Jara Montoya on 19/9/25.
//

import SwiftUI

struct BlankView: View {
  // MARK: - PROPERTY
  
  var backgroundColor: Color
  var backgroundOpacity: Double
  
  // MARK: - BODY
  
  var body: some View {
    VStack {
      Spacer()
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
    .background(backgroundColor)
    .opacity(backgroundOpacity)
    .blendMode(.overlay)
    .edgesIgnoringSafeArea(.all)
  }
}

// MARK: - PREVIEW

#Preview {
    BlankView(backgroundColor: Color.black, backgroundOpacity: 0.3)
}

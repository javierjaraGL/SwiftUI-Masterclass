//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Javier Jara Montoya on 22/9/25.
//

import SwiftUI

struct HeaderView: View {
  // MARK: - PROPERTY
  
  var title: String = ""

  // MARK: - BODY

  var body: some View {
    VStack {
      // TITLE
      if title != "" {
        Text(title.uppercased())
          .font(.title3)
          .fontWeight(.bold)
          .foregroundColor(.accentColor)
      }
      
      // SEPARATOR
      HStack {
        Capsule()
          .frame(height: 1)
        
        Image(systemName: "note.text")
        
        Capsule()
          .frame(height: 1)
      } //: HSTACK
      .foregroundColor(.accentColor)
    } //: VSTACK
  }
}

#Preview("With Title") {
    HeaderView(title: "Credits")
}

#Preview {
    HeaderView()
}

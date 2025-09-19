//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Javier Jara Montoya on 16/9/25.
//

import SwiftUI

struct SettingsLabelView: View {
    // MARK: - PROPERTIES
    
    var labelText: String
    var labelImage: String

    // MARK: - BODY

    var body: some View {
      HStack {
        Text(labelText.uppercased()).fontWeight(.bold)
        Spacer()
        Image(systemName: labelImage)
      }
    }
  }

#Preview {
    SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
}

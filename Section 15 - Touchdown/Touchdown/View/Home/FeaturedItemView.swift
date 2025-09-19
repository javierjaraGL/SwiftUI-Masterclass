//
//  FeaturedItemView.swift
//  Touchdown
//
//  Created by Javier Jara Montoya on 19/9/25.
//

import SwiftUI

struct FeaturedItemView: View {
  // MARK: - PROPERTY
  
  let player: Player
  
  // MARK: - BODY
  
  var body: some View {
    Image(player.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
  }
}

// MARK: - PREVIEW
#Preview {
    FeaturedItemView(player: players[0])
}

//
//  CoverImageView.swift
//  Africa
//
//  Created by Javier Jara Montoya on 17/9/25.
//

import SwiftUI

struct CoverImageView: View {
  // MARK: - PROPERTIES
  
  let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
  
  // MARK: - BODY
  
  var body: some View {
    TabView {
      ForEach(coverImages) { item in
        Image(item.name)
          .resizable()
          .scaledToFill()
      } //: LOOP
    } //: TAB
  }
}

#Preview {
    CoverImageView()
}

//
//  BrandGridView.swift
//  Touchdown
//
//  Created by Javier Jara Montoya on 19/9/25.
//

import SwiftUI

struct BrandGridView: View {
  // MARK: - PROPERTY
  
  // MARK: - BODY
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false, content: {
      LazyHGrid(rows: gridLayout, spacing: columnSpacing, content: {
        ForEach(brands) { brand in
          BrandItemView(brand: brand)
        }
      }) //: GRID
      .frame(height: 200)
      .padding(15)
    }) //: SCROLL
  }
}

#Preview {
    BrandGridView()
}

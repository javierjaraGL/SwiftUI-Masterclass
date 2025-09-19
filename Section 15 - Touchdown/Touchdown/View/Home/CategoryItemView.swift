//
//  CategoryItemView.swift
//  Touchdown
//
//  Created by Javier Jara Montoya on 19/9/25.
//

import SwiftUI


struct CategoryItemView: View {
  // MARK: - PROPERTY
  
  let category: Category
  
  // MARK: - BODY
  
  var body: some View {
    Button(action: {}, label: {
      HStack(alignment: .center, spacing: 6) {
        Image(category.image)
          .renderingMode(.template)
          .resizable()
          .scaledToFit()
          .frame(width: 30, height: 30, alignment: .center)
        Text(category.name.uppercased())
          .fontWeight(.light)

        Spacer()
      } //: HSTACK
      .foregroundColor(.gray)
      .padding()
      .background(Color.white.cornerRadius(12))
      .background(
        RoundedRectangle(cornerRadius: 12)
          .stroke(Color.gray, lineWidth: 1)
      )
    }) //: BUTTON
  }
}


#Preview {
    CategoryItemView(category: categories[0])
}

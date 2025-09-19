//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Javier Jara Montoya on 17/9/25.
//

import SwiftUI
struct AnimalGridItemView: View {
  // MARK: - PROPERTIES
  
  let animal: Animal

  // MARK: - BODY

  var body: some View {
    Image(animal.image)
      .resizable()
      .scaledToFit()
      .cornerRadius(12)
  }
}

// MARK: - PREVIEW
#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    AnimalGridItemView(animal: animals[0])
}

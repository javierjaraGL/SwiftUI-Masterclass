//
//  InsetFactView.swift
//  Africa
//
//  Created by Javier Jara Montoya on 18/9/25.
//

import SwiftUI

struct InsetFactView: View {
  // MARK: - PROPERTIES
  
  let animal: Animal

  // MARK: - BODY

  var body: some View {
    GroupBox {
      TabView {
        ForEach(animal.fact, id: \.self) { item in
          Text(item)
        }
      } //: TABS
      .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
    } //: BOX
  }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    InsetFactView(animal: animals[0])
}

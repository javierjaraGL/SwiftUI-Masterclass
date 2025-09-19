//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Javier Jara Montoya on 17/9/25.
//

import SwiftUI

import SwiftUI

struct ExternalWeblinkView: View {
  // MARK: - PROPERTIES
  
  let animal: Animal

  // MARK: - BODY

  var body: some View {
    GroupBox {
      HStack {
        Image(systemName: "globe")
        Text("Wikipedia")
        Spacer()
        
        Group {
          Image(systemName: "arrow.up.right.square")
          
          Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
        }
        .foregroundColor(.accentColor)
      } //: HSTACK
    } //: BOX
  }
}

#Preview {
    let animals: [Animal] = Bundle.main.decode("animals.json")
    ExternalWeblinkView(animal: animals[0])
}

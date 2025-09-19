//
//  SourceLinkView.swift
//  Fructus
//
//  Created by Javier Jara Montoya on 16/9/25.
//

import SwiftUI

struct SourceLinkView: View {
  var body: some View {
    GroupBox() {
      HStack {
        Text("Content source")
        Spacer()
          Link(destination: URL(string: "https://wikipedia.com")!) {
              Text("Wikipedia")
              Image(systemName: "arrow.up.right.square")
          }
//        Link("Wikipedia", destination: URL(string: "https://wikipedia.com")!)
//          Image(systemName: "arrow.up.right.square")
      }
      .font(.footnote)
    }
  }
}

#Preview {
    SourceLinkView()
}

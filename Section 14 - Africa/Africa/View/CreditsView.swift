//
//  CreditsView.swift
//  Africa
//
//  Created by Javier Jara Montoya on 17/9/25.
//

import SwiftUI


struct CreditsView: View {
  var body: some View {
    VStack {
      Image("compass")
        .resizable()
        .scaledToFit()
        .frame(width: 128, height: 128)
      
      Text("""
  Copyright © Robert Petras
  All right reserved
  Better Apps ♡ Less Code
  """)
        .font(.footnote)
        .multilineTextAlignment(.center)
    } //: VSTACK
    .padding()
    .opacity(0.4)
  }
}

#Preview {
    CreditsView()
}

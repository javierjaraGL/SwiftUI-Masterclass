//
//  CustomShape.swift
//  Touchdown
//
//  Created by Javier Jara Montoya on 19/9/25.
//

import Foundation

import SwiftUI

struct CustomShape: Shape {
  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
    
    return Path(path.cgPath)
  }
}

#Preview {
    CustomShape()
}

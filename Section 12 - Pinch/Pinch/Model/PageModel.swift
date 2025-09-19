//
//  PageModel.swift
//  Pinch
//
//  Created by Javier Jara Montoya on 16/9/25.
//

import Foundation

struct Page: Identifiable {
  let id: Int
  let imageName: String
}

extension Page {
  var thumbnailName: String {
    return "thumb-" + imageName
  }
}

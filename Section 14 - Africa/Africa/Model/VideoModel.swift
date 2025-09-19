//
//  VideoModel.swift
//  Africa
//
//  Created by Javier Jara Montoya on 18/9/25.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String
  
  // Computed Property
  var thumbnail: String {
    "video-\(id)"
  }
}

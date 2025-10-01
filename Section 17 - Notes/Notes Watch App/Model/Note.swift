//
//  Note.swift
//  Notes Watch App
//
//  Created by Javier Jara Montoya on 22/9/25.
//

import Foundation

struct Note: Identifiable, Codable {
  let id: UUID
  let text: String
}


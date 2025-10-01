//
//  ThemeSettings.swift
//  Todo App
//
//  Created by Javier Jara Montoya on 23/9/25.
//


import SwiftUI

// MARK: - THEME CLASS

final public class ThemeSettings: ObservableObject {
  @Published public var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme") {
    didSet {
      UserDefaults.standard.set(self.themeSettings, forKey: "Theme")
    }
  }
  
  private init() {}
  public static let shared = ThemeSettings()
}

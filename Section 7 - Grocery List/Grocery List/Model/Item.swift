//
//  Item.swift
//  Grocery List
//
//  Created by Javier Jara Montoya on 9/9/25.
//

import SwiftData

@Model class Item {
    var title: String
    var isCompleted: Bool
    
    init(title: String, isCompleted: Bool) {
        self.title = title
        self.isCompleted = isCompleted
    }
}

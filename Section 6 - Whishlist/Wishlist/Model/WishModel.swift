//
//  WishModel.swift
//  Wishlist
//
//  Created by Javier Jara Montoya on 9/9/25.
//

import SwiftData
import Foundation

@Model class Wish {
    var title: String

    init(title: String) {
        self.title = title
    }
}

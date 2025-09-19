//
//  TIp.swift
//  Grocery List
//
//  Created by Javier Jara Montoya on 9/9/25.
//

import TipKit
import Foundation

struct ButtonTip: Tip {
    var title: Text = Text("Essencial Foods")
    var message: Text? = Text("Add some everyday items to the shopping list.")
    var image: Image? = Image(systemName: "info.circle")
}

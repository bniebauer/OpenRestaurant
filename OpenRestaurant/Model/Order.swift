//
//  Order.swift
//  OpenRestaurant
//
//  Created by Brenton Niebauer on 6/16/21.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}

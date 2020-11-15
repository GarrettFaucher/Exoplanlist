//
//  ItemStore.swift
//  Exoplanlist
//
//  Created by Garrett on 11/14/20.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        allItems.append(newItem)
        return newItem
    }
}

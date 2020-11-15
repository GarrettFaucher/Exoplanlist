//
//  Item.swift
//  Exoplanlist
//
//  Created by Garrett on 11/14/20.
//

import UIKit

class Item: Equatable {
    var name: String
    var discoveryMethod: String
    var distance: Float?
    var dateDiscovered: Date?
    
    init(name: String, discoveryMethod: String, distance: Float?, dateDiscovered: Date?) {
        self.name = name
        self.discoveryMethod = discoveryMethod
        self.distance = distance
        self.dateDiscovered = dateDiscovered
    }
    
    convenience init(random: Bool = false) {
        if random {
            let starName = ["Star-1", "Star-2", "Star-3"]
            let id = ["b", "c", "d"]
            
            let randomStarName = starName.randomElement()!
            let randomId = id.randomElement()!
            
            let methods = ["Transit", "Radial Velocity", "Imaging"]
            let randomMethod = methods.randomElement()!
            
            let randomName = "\(randomStarName) \(randomId)"
            
            let randomNum = Float.random(in: 0..<100)
            let randomDate = Date(timeIntervalSince1970: Double(randomNum*1000000))

            self.init(name: randomName,
                      discoveryMethod: randomMethod,
                      distance: randomNum,
                      dateDiscovered: randomDate)
        } else {
            self.init(name: "",
                      discoveryMethod: "",
                      distance: 0,
                      dateDiscovered: Date(timeIntervalSinceNow: 0)
            )
        }
    }
    
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
            && lhs.discoveryMethod == rhs.discoveryMethod
            && lhs.distance == rhs.distance
            && lhs.dateDiscovered == rhs.dateDiscovered
    }
}

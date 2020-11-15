//
//  Item.swift
//  Exoplanlist
//
//  Created by Garrett on 11/14/20.
//

import UIKit

class Item {
    var name: String
    var discoveryMethod: String
    var distance: Float?
    var orbitalEccentricity: Float?
    var planetRadius: Float?
    
    init(name: String, discoveryMethod: String, distance: Float?, orbitalEccentricity: Float?, planetRadius: Float?) {
        self.name = name
        self.discoveryMethod = discoveryMethod
        self.distance = distance
        self.orbitalEccentricity = orbitalEccentricity
        self.planetRadius = planetRadius
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
            let randomValue = Float.random(in: 0..<100)

            self.init(name: randomName,
                      discoveryMethod: randomMethod,
                      distance: randomValue,
                      orbitalEccentricity: randomValue,
                      planetRadius: randomValue)
        } else {
            self.init(name: "",
                      discoveryMethod: "",
                      distance: 0,
                      orbitalEccentricity: 0,
                      planetRadius: 0
            )
        }
    }
}

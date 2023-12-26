//
//  PlantView.swift
//  PlantGrowinator
//
//  Created by Owen Sleigh on 9/23/23.
//

import Foundation
import SwiftUI

struct Plant : Identifiable, Codable {
    let id: UUID
    var name: String
    var picture: Image
    var timeToWater: Int
    var timeToWaterAsDouble: Double {
        get {
            Double(timeToWater)
        }
        set {
            timeToWater = Int(newValue)
        }
    }
    var timeToFertilize: Int
    var timeToFertilizeAsDouble: Double {
        get {
            Double(timeToFertilize)
        }
        set {
            timeToFertilize = Int(newValue)
        }
    }
    
    init(id: UUID = UUID(), name: String, timeToWater: Int, timeToFertilize: Int, picture: Image) {
        self.id = id
        self.name = name
        self.timeToWater = timeToWater
        self.timeToFertilize = timeToFertilize
        self.picture = picture
    }
}

extension Plant {
    static var emptyPlant: Plant {
        Plant(name: "", timeToWater: 7, timeToFertilize: 7, picture: Image("avatar"))
    }
}

//extension Plant {
//    static let testData: [Plant] =
//    [
//        Plant(name: "swiss cheese", timeToWater: 7, timeToFertilize: 21),
//        Plant(name: "pothos", timeToWater: 5, timeToFertilize: 14),
//        Plant(name: "fig", timeToWater: 10, timeToFertilize: 30),
//        Plant(name: "cactus", timeToWater: 14, timeToFertilize: 0),
//        Plant(name: "snake", timeToWater: 8, timeToFertilize: 20),
//        Plant(name: "ponytail", timeToWater: 20, timeToFertilize: 0)
//    ]
//}

//
//  ArmyUnit.swift
//  PtG Roster
//
//  Created by Adam Sadler on 9/30/23.
//

import Foundation
import SwiftData

@Model
final class ArmyUnit {
    var name: String
    var warscroll: String
    var veteranAbilities: [String] = []
    var notes: [String] = []
    var isReinforcedOnce: Bool = false
    var isReinforcedTwice: Bool = false
    var casualtyScore: Int = 0
    var renown: Int = 0
    var points: Int = 0
    
    init(name: String, warscroll: String, points: Int) {
        self.name = name
        self.warscroll = warscroll
        self.points = points
    }
}

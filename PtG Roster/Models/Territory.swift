//
//  Territory.swift
//  PtG Roster
//
//  Created by Adam Sadler on 9/30/23.
//

import Foundation
import SwiftData

@Model
final class Territory {
    var name: String
    var type: String
    var effect: String
    var isUpgraded: Bool
    
    init(name: String, type: String, effect: String, isUpgraded: Bool = false) {
        self.name = name
        self.type = type
        self.effect = effect
        self.isUpgraded = isUpgraded
    }
}

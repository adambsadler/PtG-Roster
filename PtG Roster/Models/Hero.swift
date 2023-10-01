//
//  Hero.swift
//  PtG Roster
//
//  Created by Adam Sadler on 9/30/23.
//

import Foundation
import SwiftData

@Model
final class Hero {
    var name: String
    var warscroll: String
    var commandTrait: Enhancement?
    var enhancements: [Enhancement]? = []
    var notes: [String] = []
    var injury: String?
    var renown: Int = 0
    var points: Int
    
    init(name: String, warscroll: String, points: Int) {
        self.name = name
        self.warscroll = warscroll
        self.points = points
    }
}

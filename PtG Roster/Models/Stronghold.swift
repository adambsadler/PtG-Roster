//
//  Stronghold.swift
//  PtG Roster
//
//  Created by Adam Sadler on 9/30/23.
//

import Foundation
import SwiftData

@Model
final class Stronghold {
    var name: String
    var type: String
    var barracks: Int
    
    init(name: String, barracks: Int = 0) {
        self.name = name
        self.type = "Stronghold"
        self.barracks = barracks
    }
}

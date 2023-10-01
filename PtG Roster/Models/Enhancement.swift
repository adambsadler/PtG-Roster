//
//  Enhancement.swift
//  PtG Roster
//
//  Created by Adam Sadler on 9/30/23.
//

import Foundation
import SwiftData

@Model
final class Enhancement {
    var type: String
    var name: String
    var rules: String
    
    init(type: EnhancementType, name: String, rules: String) {
        self.type = type.rawValue
        self.name = name
        self.rules = rules
    }
}

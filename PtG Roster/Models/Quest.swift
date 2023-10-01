//
//  Quest.swift
//  PtG Roster
//
//  Created by Adam Sadler on 9/30/23.
//

import Foundation
import SwiftData

@Model
final class Quest {
    var name: String
    var reward: String
    var progress: Int
    
    init(name: String, reward: String, progress: Int = 0) {
        self.name = name
        self.reward = reward
        self.progress = progress
    }
}

//
//  OrderOfBattle.swift
//  PtG Roster
//
//  Created by Adam Sadler on 9/30/23.
//

import Foundation
import SwiftData

@Model
final class OrderOfBattle {
    var totalUnitLimit: Int
    var heroLimit: Int = 1
    var monsterLimit: Int = 1
    var warMachineLimit: Int = 1
    var wizardLimit: Int = 1
    var priestLimit: Int = 1
    var reinforcedUnitLimit: Int = 1
    var allies: Int = 1
    var warlord: Hero?
    var heroes: [Hero]? = []
    var units: [ArmyUnit]? = []
    
    init(armySize: ArmySize) {
        switch armySize {
        case .vanguard:
            self.totalUnitLimit = 6
        case .warband:
            self.totalUnitLimit = 8
        case .brigade:
            self.totalUnitLimit = 12
        case .legion:
            self.totalUnitLimit = 16
        }
    }
}

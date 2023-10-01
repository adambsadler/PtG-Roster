//
//  Army.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import Foundation
import SwiftData

@Model
final class Army {
    var name: String
    var faction: String
    var subfaction: String
    var realm: String
    var startingSize: String
    var startingTerritory: String
    var gloryPoints: Int = 0
    var vault: Vault
    @Relationship(deleteRule: .cascade) var currentQuest: Quest?
    @Relationship(deleteRule: .cascade) var stronghold: Stronghold
    var battlesFought: Int = 0
    var victoriesWon: Int = 0
    var questsCompleted: Int = 0
    var heroesSlain: Int = 0
    @Relationship(deleteRule: .cascade) var currentTerritories: [Territory]? = []
    @Relationship(deleteRule: .cascade) var orderOfBattle: OrderOfBattle
    
    init(name: String, faction: String, subfaction: String, realm: String, startingSize: ArmySize, startingTerritory: String, strongHoldName: String) {
        self.name = name
        self.faction = faction
        self.subfaction = subfaction
        self.realm = realm
        self.startingSize = startingSize.rawValue
        self.startingTerritory = startingTerritory
        self.stronghold = Stronghold(name: strongHoldName)
        self.vault = Vault()
        self.orderOfBattle = OrderOfBattle(armySize: startingSize)
    }
}

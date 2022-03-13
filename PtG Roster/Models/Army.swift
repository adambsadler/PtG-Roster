//
//  Army.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import Foundation
import SwiftUI

struct Army: Codable, Identifiable {
    var id: UUID
    var name: String
    var faction: String
    var subfaction: String
    var realm: Realm
    var startingSize: Size
    var startingTerritory: Territory
    var gloryPoints: Int = 0
    var vault: [Vault] = []
    
    init(id: UUID = UUID(), name: String, faction: String, subfaction: String, realm: Realm, startingSize: Size, startingTerritory: Territory) {
        self.id = id
        self.name = name
        self.faction = faction
        self.subfaction = subfaction
        self.realm = realm
        self.startingSize = startingSize
        self.startingTerritory = startingTerritory
    }
    
    enum Realm: String, Codable, CaseIterable {
        case azyr = "Azyr"
        case ghyran = "Ghyran"
        case ghur = "Ghur"
        case chamon = "Chamon"
        case aqshy = "Aqshy"
        case shyish = "Shyish"
        case ulgu = "Ulgu"
        case hysh = "Hysh"
    }
    
    enum Size: String, Codable, CaseIterable {
        case vanguard = "Vanguard"
        case warband = "Warband"
        case brigade = "Brigade"
        case legion = "Legion"
    }
    
    enum Territory: String, Codable, CaseIterable {
        case oldKeep = "Old Keep"
        case wildLands = "Wild Lands"
        case forgottenMine = "Forgotten Mine"
        case arcaneWaypoint = "Arcane Waypoint"
        case sacredSite = "Sacred Site"
        case smallSettlement = "Small Settlement"
        case ancientRoads = "Ancient Roads"
    }
}

extension Army {
    struct Vault: Identifiable, Codable {
        let id: UUID
        var type: String
        var name: String
        
        init(id: UUID = UUID(), type: String, name: String) {
            self.id = id
            self.type = type
            self.name = name
        }
    }
    
    struct Data {
        var name: String = ""
        var faction: String = ""
        var subfaction: String = ""
        var realm: Realm = Realm.azyr
        var startingSize: Size = Size.vanguard
        var startingTerritory: Territory = Territory.oldKeep
        var gloryPoints: Int = 0
        var vault: [Vault] = []
    }
    
    var data: Data {
        Data(name: name, faction: faction, subfaction: subfaction, realm: realm, startingSize: startingSize, startingTerritory: startingTerritory, gloryPoints: gloryPoints, vault: vault)
    }
    
    mutating func update(from data: Data) {
        name = data.name
        faction = data.faction
        subfaction = data.subfaction
        realm = data.realm
        startingSize = data.startingSize
        startingTerritory = data.startingTerritory
        gloryPoints = data.gloryPoints
        vault = data.vault
    }
    
    init(data: Data) {
        id = UUID()
        name = data.name
        faction = data.faction
        subfaction = data.subfaction
        realm = data.realm
        startingSize = data.startingSize
        startingTerritory = data.startingTerritory
        gloryPoints = data.gloryPoints
        vault = data.vault
    }
}

extension Army {
    static let sampleData: [Army] =
    [
        Army(name: "Acoyltes of Azyr", faction: "Stormcast Eternals", subfaction: "Hallowed Knights", realm: Army.Realm.azyr, startingSize: Army.Size.warband, startingTerritory: Army.Territory.sacredSite),
        Army(name: "Rotgut's Disciples", faction: "Maggotkin of Nurgle", subfaction: "Pusgoyle", realm: Army.Realm.ulgu, startingSize: Army.Size.warband, startingTerritory: Army.Territory.wildLands)
    ]
}

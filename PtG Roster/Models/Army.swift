//
//  Army.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import Foundation
import SwiftUI

struct Army: Codable {
    var id: Int
    var name: String
    var faction: String
    var subfaction: String
    var realm: Realm
    var startingSize: Size
    var startingTerriroty: Territory
    
    enum Realm: String, Codable {
        case azyr = "Azyr"
        case ghyran = "Ghyran"
        case ghur = "Ghur"
        case chamon = "Chamon"
        case aqshy = "Aqshy"
        case shyish = "Shyish"
        case ulgu = "Ulgu"
        case hysh = "Hysh"
    }
    
    enum Size: String, Codable {
        case vanguard = "Vanguard"
        case warband = "Warband"
        case brigade = "Brigade"
        case legion = "Legion"
    }
    
    enum Territory: String, Codable {
        case oldKeep = "Old Keep"
        case wildLands = "Wild Lands"
        case forgottenMine = "Forgotten Mine"
        case arcaneWaypoint = "Arcane Waypoint"
        case sacredSite = "Sacred Site"
        case smallSettlement = "Small Settlement"
        case ancientRoads = "Ancient Roads"
    }
}

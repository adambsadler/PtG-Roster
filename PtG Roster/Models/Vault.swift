//
//  Vault.swift
//  PtG Roster
//
//  Created by Adam Sadler on 9/30/23.
//

import Foundation
import SwiftData

@Model
final class Vault {
    var artefacts: [Enhancement]? = []
    var spells: [Enhancement]? = []
    var prayers: [Enhancement]? = []
    var uniqueEnhancements: [Enhancement]? = []
    var invocations: [Enhancement]? = []
    var battalions: [Enhancement]? = []
    var triump: Enhancement?
    
    init() { }
}

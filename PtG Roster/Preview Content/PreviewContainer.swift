//
//  PreviewContainer.swift
//  PtG Roster
//
//  Created by Adam Sadler on 10/1/23.
//

import SwiftUI
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Army.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        var sampleArmy = Army(name: "Azyr Acolytes", faction: "Stormcast Eternals", subfaction: "Hallowed Knights", realm: "Azyr", currentSize: .vanguard, startingTerritory: "Sacred Site", strongHoldName: "Hope's Bastion")
        var sampleArmy2 = Army(name: "Rotgut's Disciples", faction: "Maggotking of Nurgle", subfaction: "Father's Chosen", realm: "Ghur", currentSize: .vanguard, startingTerritory: "Old Keep", strongHoldName: "The Nest")
        
        container.mainContext.insert(sampleArmy)
        container.mainContext.insert(sampleArmy2)
        
        return container
    } catch {
        fatalError("Failed to create preview container")
    }
}()

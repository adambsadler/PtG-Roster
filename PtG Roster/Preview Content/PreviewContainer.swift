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
        
        var sampleArmy = Army(name: "Azyr Acolytes", faction: "Stormcast Eternals", subfaction: "Hallowed Knights", realm: "Azyr", startingSize: .vanguard, startingTerritory: "Sacred Site", strongHoldName: "Hope's Bastion")
        
        container.mainContext.insert(sampleArmy)
        
        return container
    } catch {
        fatalError("Failed to create preview container")
    }
}()

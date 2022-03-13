//
//  PtG_RosterApp.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import SwiftUI

@main
struct PtG_RosterApp: App {
    @StateObject private var armyData = ArmyData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView(armies: $armyData.armies) {
                    Task {
                        do {
                            try await ArmyData.save(armies: armyData.armies)
                        } catch {
                            fatalError("Error saving armies.")
                        }
                    }
                }
            }
            .task {
                do {
                    armyData.armies = try await ArmyData.load()
                } catch {
                    fatalError("Error loading armies.")
                }
            }
        
        }
    }
}

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
    @State private var errorWrapper: ErrorWrapper?
    
    var body: some Scene {
        WindowGroup {
            ContentView(armies: $armyData.armies) {
                Task {
                    do {
                        try await ArmyData.save(armies: armyData.armies)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                    }
                }
            }
            .task {
                do {
                    armyData.armies = try await ArmyData.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "The application will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                armyData.armies = Army.sampleData
            }) {wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}

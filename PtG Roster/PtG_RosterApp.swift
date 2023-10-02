//
//  PtG_RosterApp.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import SwiftUI
import SwiftData

@main
struct PtG_RosterApp: App {
    @StateObject var navManager = NavManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(navManager)
        }
        .modelContainer(for: Army.self)
    }
}

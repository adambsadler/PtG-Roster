//
//  PtG_RosterApp.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import SwiftUI

@main
struct PtG_RosterApp: App {
    @StateObject private var data = ArmyData()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView() {
                    ArmyData.save(armies: data.armies) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            .onAppear {
                ArmyData.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case .success(let armies):
                        data.armies = armies
                    }
                }
            }
        
        }
    }
}

//
//  ArmyListView.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import SwiftUI

struct ArmyListView: View {
    @Binding var armies: [Army]
    @State private var isPresentingNewArmyView = false
    @State private var newArmyData = Army.Data()
    
    var body: some View {
            List {
                ForEach($armies) { $army in
                    NavigationLink(destination: ArmyDetailView(army: $army)) {
                        ArmyRow(army: army)
                    }
                }
            }
            .navigationTitle("My Armies")
            .toolbar {
                Button(action: {
                    isPresentingNewArmyView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Army")
            }
            .sheet(isPresented: $isPresentingNewArmyView) {
                NavigationView {
                    CreateArmyView(data: $newArmyData)
                        .toolbar {
                            ToolbarItem(placement: .cancellationAction) {
                                Button("Cancel") {
                                    isPresentingNewArmyView = false
                                    newArmyData = Army.Data()
                                }
                            }
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Create") {
                                    let newArmy = Army(data: newArmyData)
                                    armies.append(newArmy)
                                    isPresentingNewArmyView = false
                                    newArmyData = Army.Data()
                                }
                            }
                        }
                }
            }
    }
}

struct ArmyListView_Previews: PreviewProvider {
    static var previews: some View {
        ArmyListView(armies: .constant(Army.sampleData))
    }
}

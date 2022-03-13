//
//  ArmyDetailView.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/13/22.
//

import SwiftUI

struct ArmyDetailView: View {
    @Binding var army: Army
    
    @State private var data = Army.Data()
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Army Details")) {
                HStack {
                    Text("Army Name:")
                        .font(.headline)
                    Spacer()
                    Text(army.name)
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Faction:")
                        .font(.headline)
                    Spacer()
                    Text(army.faction)
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Subfaction:")
                        .font(.headline)
                    Spacer()
                    Text(army.subfaction)
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Realm of Origin:")
                        .font(.headline)
                    Spacer()
                    Text(army.realm.rawValue)
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Starting Size:")
                        .font(.headline)
                    Spacer()
                    Text(army.startingSize.rawValue)
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Glory Points:")
                        .font(.headline)
                    Spacer()
                    Text(String(army.gloryPoints))
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Quest Log")) {
                HStack {
                    Text("Current Quest:")
                        .font(.headline)
                    Spacer()
                    Text("")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Quest Reward:")
                        .font(.headline)
                    Spacer()
                    Text("")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Quest Progress:")
                        .font(.headline)
                    Spacer()
                    Text("")
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Stronghold")) {
                HStack {
                    Text("Name:")
                        .font(.headline)
                    Spacer()
                    Text("")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Barracks:")
                        .font(.headline)
                    Spacer()
                    Text("")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Type:")
                        .font(.headline)
                    Spacer()
                    Text("")
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Achievements")) {
                HStack {
                    Text("Battles Fought:")
                        .font(.headline)
                    Spacer()
                    Text("")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Victories Won:")
                        .font(.headline)
                    Spacer()
                    Text("")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Quests Completed:")
                        .font(.headline)
                    Spacer()
                    Text("")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Text("Enemy Heroes Slain:")
                        .font(.headline)
                    Spacer()
                    Text("")
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Territories")) {
                HStack {
                    Text("Type:")
                        .font(.headline)
                    Spacer()
                    Text(army.startingTerritory.rawValue)
                }
                .accessibilityElement(children: .combine)
            }
            Section(header: Text("Vault")) {
                ForEach(army.vault) { upgrade in
                    HStack {
                        Text("\(upgrade.type.rawValue):").font(.headline)
                        Spacer()
                        Text(upgrade.name)
                    }
                }
            }
        }
        .navigationTitle(army.name)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                data = army.data
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            NavigationView {
                DetailEditView(data: $data)
                    .navigationTitle(army.name)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                army.update(from: data)
                            }
                        }
                    }
            }
        }
    }
}

struct ArmyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArmyDetailView(army: .constant(Army.sampleData[0]))
    }
}

//
//  DetailEditView.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/13/22.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var data: Army.Data
    @State private var newUpgradeName = ""
    @State private var newUpgradeType = Army.Enhancement.EnhancementType.artefactOfPower
    @State private var newTerritoryName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Army Details")) {
                TextField("Name", text: $data.name)
                    .disableAutocorrection(true)
                TextField("Faction", text: $data.faction)
                    .disableAutocorrection(true)
                TextField("Subfaction", text: $data.subfaction)
                    .disableAutocorrection(true)
                Picker("Choose Realm", selection: $data.realm) {
                    ForEach(Army.Realm.allCases, id: \.self) { realm in
                        Text(realm.rawValue)
                    }
                }
                Picker("Choose Size", selection: $data.startingSize) {
                    ForEach(Army.Size.allCases, id: \.self) { size in
                        Text(size.rawValue)
                    }
                }
                Picker("Choose Territory", selection: $data.startingTerritory) {
                    ForEach(Army.Territory.allCases, id: \.self) { territory in
                        Text(territory.rawValue)
                    }
                }
                HStack {
                    Text("Glory points:")
                    TextField("Glory Points", value: $data.gloryPoints, formatter: NumberFormatter())
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                }
            }
            Section(header: Text("QuestLog")) {
                TextField("Current Quest", text: $data.currentQuest)
                    .disableAutocorrection(true)
                TextField("Quest Reward", text: $data.questReward)
                    .disableAutocorrection(true)
                HStack {
                    Text("Quest Progress:")
                    TextField("Quest Progress", value: $data.questProgress, formatter: NumberFormatter())
                        .multilineTextAlignment(.trailing)
                }
            }
            Section(header: Text("Stronghold")) {
                TextField("Stronghold Name", text: $data.strongholdName)
                    .disableAutocorrection(true)
                HStack {
                    Text("Barracks:")
                    TextField("Barracks", value: $data.barracks, formatter: NumberFormatter())
                        .multilineTextAlignment(.trailing)
                }
                Picker("Stronghold Type", selection: $data.strongholdType) {
                    ForEach(Army.StrongholdType.allCases, id: \.self) { sType in
                        Text(sType.rawValue).tag(sType)
                    }
                }
            }
            Section(header: Text("Achievements")) {
                HStack {
                    Text("Battles Fought:")
                    TextField("Battles Fought", value: $data.battlesFought, formatter: NumberFormatter())
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Victories Won:")
                    TextField("Victories Won", value: $data.victoriesWon, formatter: NumberFormatter())
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Quests Completed:")
                    TextField("Quests Completed", value: $data.questsCompleted, formatter: NumberFormatter())
                        .multilineTextAlignment(.trailing)
                }
                HStack {
                    Text("Enemy Heroes Slain:")
                    TextField("Heroes Slain", value: $data.heroesSlain, formatter: NumberFormatter())
                        .multilineTextAlignment(.trailing)
                }
            }
            Section(header: Text("Territories")) {
                Text(data.startingTerritory.rawValue)
                ForEach(data.currentTerritory, id: \.self) { territory in
                    Text(territory)
                }
                .onDelete { indices in
                    data.vault.remove(atOffsets: indices)
            }
                HStack {
                    TextField("New Territory", text: $newTerritoryName)
                        .disableAutocorrection(true)
                    Button(action: {
                        withAnimation {
                            let territory = newTerritoryName
                            data.currentTerritory.append(territory)
                            newTerritoryName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newTerritoryName.isEmpty)
                }
            }
            Section(header: Text("Vault")) {
                ForEach(data.vault) { upgrade in
                    Text(upgrade.name)
                }
                .onDelete { indices in
                    data.vault.remove(atOffsets: indices)
                }
                HStack {
                    TextField("New Enhancement", text: $newUpgradeName)
                        .disableAutocorrection(true)
                    Button(action: {
                        withAnimation {
                            let upgrade = Army.Enhancement(type: newUpgradeType, name: newUpgradeName)
                            data.vault.append(upgrade)
                            newUpgradeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newUpgradeName.isEmpty)
                }
                Picker("Enhancement Type", selection: $newUpgradeType) {
                    ForEach(Army.Enhancement.EnhancementType.allCases, id: \.self) { eType in
                        Text(eType.rawValue).tag(eType)
                    }
                }
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(Army.sampleData[0].data))
    }
}

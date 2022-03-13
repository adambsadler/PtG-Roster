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
    @State private var newUpgradeType = ""
    
    var body: some View {
        Form {
            Section(header: Text("Army Details")) {
                TextField("Name", text: $data.name)
                TextField("Faction", text: $data.faction)
                TextField("Subfaction", text: $data.subfaction)
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
                    Text("Glory points")
                    TextField("Glory Points", value: $data.gloryPoints, formatter: NumberFormatter())
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
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
                    Button(action: {
                        withAnimation {
                            let upgrade = Army.Vault(type: newUpgradeType, name: newUpgradeName)
                            data.vault.append(upgrade)
                            newUpgradeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newUpgradeName.isEmpty)
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

//
//  CreateArmyView.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/13/22.
//

import SwiftUI

struct CreateArmyView: View {
    @Binding var data: Army.Data
    
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
            }
        }
    }
}

struct CreateArmyView_Previews: PreviewProvider {
    static var previews: some View {
        CreateArmyView(data: .constant(Army.sampleData[0].data))
    }
}

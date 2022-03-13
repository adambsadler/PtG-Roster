//
//  ArmyListView.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import SwiftUI

struct ArmyListView: View {
    var body: some View {
            List {
                ArmyRow(army: Army(id: 1, name: "Acoyltes of Azyr", faction: "Stormcast Eternals", subfaction: "Hallowed Knights", realm: Army.Realm.azyr, startingSize: Army.Size.warband, startingTerriroty: Army.Territory.sacredSite))
            }
            .navigationTitle("My Armies")
    }
}

struct ArmyListView_Previews: PreviewProvider {
    static var previews: some View {
        ArmyListView()
    }
}

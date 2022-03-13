//
//  ArmyRow.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import SwiftUI

struct ArmyRow: View {
    var army: Army
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(army.name)
                .font(.title)
                .multilineTextAlignment(.leading)
            Text(army.faction)
                .font(.subheadline)
            Text(army.startingSize.rawValue)
                .font(.subheadline)
        }
        
    }
}

struct ArmyRow_Previews: PreviewProvider {
    static var previews: some View {
        ArmyRow(army: Army(id: 1, name: "Acoyltes of Azyr", faction: "Stormcast Eternals", subfaction: "Hallowed Knights", realm: Army.Realm.azyr, startingSize: Army.Size.warband, startingTerriroty: Army.Territory.sacredSite)).previewLayout(.fixed(width: 300, height: 70))
    }
}

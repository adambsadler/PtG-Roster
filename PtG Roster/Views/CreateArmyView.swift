//
//  CreateArmyView.swift
//  PtG Roster
//
//  Created by Adam Sadler on 10/1/23.
//

import SwiftUI
import SwiftData

struct CreateArmyView: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var isShowingSheet: Bool
    @State var armyName: String = ""
    @State var armyFaction: String = ""
    @State var subFaction: String = ""
    @State var strongholdName: String = ""
    @State var realm: Realm = .aqshy
    @State var armySize: ArmySize = .vanguard
    @State var startingTerritory: StartingTerritory = .ancientRoads
    
    var body: some View {
        VStack {
            Text("New Army")
            
            TextField("Army Name", text: $armyName)
                .padding()
            
            TextField("Army Faction", text: $armyFaction)
                .padding()
            
            TextField("Army Subfaction", text: $subFaction)
                .padding()
            
            TextField("Stronghold Name", text: $strongholdName)
                .padding()
            
            Picker(selection: $realm) {
                ForEach(Realm.allCases, id: \.self) { option in
                    Text(option.rawValue)
                }
            } label: {
                Text("Realm of Origin")
            }
            
            Picker(selection: $armySize) {
                ForEach(ArmySize.allCases, id: \.self) { option in
                    Text(option.rawValue)
                }
            } label: {
                Text("Starting Size")
            }

            Picker(selection: $startingTerritory) {
                ForEach(StartingTerritory.allCases, id: \.self) { option in
                    Text(option.rawValue)
                }
            } label: {
                Text("Starting Territory")
            }
            
            Button(action: {
                let newArmy = Army(name: armyName, faction: armyFaction, subfaction: subFaction, realm: realm.rawValue, startingSize: armySize, startingTerritory: startingTerritory.rawValue, strongHoldName: strongholdName)
                
                modelContext.insert(newArmy)
                isShowingSheet.toggle()
                print(newArmy.name)
            }, label: {
                Text("Save Army")
            })
        }
        
    }
}

#Preview {
    CreateArmyView(isShowingSheet: .constant(false))
}

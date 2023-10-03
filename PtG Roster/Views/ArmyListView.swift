//
//  ArmyListView.swift
//  PtG Roster
//
//  Created by Adam Sadler on 10/3/23.
//

import SwiftUI
import SwiftData

struct ArmyListView: View {
    @Query private var armies: [Army]
    
    var body: some View {
        List {
            ForEach(armies) { army in
                VStack(alignment: .leading) {
                    Text(army.name)
                        .font(.headline)
                    Text(army.faction)
                }
            }
        }
        .navigationTitle("My Armies")
    }
}

#Preview {
    NavigationStack {
        ArmyListView()
            .modelContainer(previewContainer)
    }
}

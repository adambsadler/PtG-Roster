//
//  ContentView.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import SwiftUI

struct ContentView: View {
    @Binding var armies: [Army]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewArmyView = false
    @State private var newArmyData = Army.Data()
    let saveAction: ()->Void
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("PtG Background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                VStack {
                    Image("PtG Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350.0)
                    Divider()
                    NavigationLink(destination: ArmyListView(armies: $armies)) {
                        Text("My Armies")
                            .padding()
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                            .background(Color(red: 0.9, green: 0.8, blue: 0.3, opacity: 1.0))
                            .cornerRadius(25)
                            .shadow(radius: 10)
                    }
                    Divider()
                    Button(action: {
                        isPresentingNewArmyView = true
                    }) {
                        Text("New Army")
                    }
                        .accessibilityLabel("New Army")
                        .padding()
                        .foregroundColor(.black)
                        .font(.system(size: 25))
                        .background(Color(red: 0.9, green: 0.8, blue: 0.3, opacity: 1.0))
                        .cornerRadius(25)
                        .shadow(radius: 10)
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
        }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .preferredColorScheme(.dark)
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(armies: .constant(Army.sampleData), saveAction: {})
    }
}

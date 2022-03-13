//
//  ContentView.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
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
                    NavigationLink(destination: ArmyListView()) {
                        Text("My Armies")
                            .padding()
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                            .background(Color(red: 0.9, green: 0.8, blue: 0.3, opacity: 1.0))
                            .cornerRadius(25)
                            .shadow(radius: 10)
                    }
                    Divider()
                    NavigationLink(destination: CreateArmyView()) {
                        Text("New Army")
                            .padding()
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                            .background(Color(red: 0.9, green: 0.8, blue: 0.3, opacity: 1.0))
                            .cornerRadius(25)
                            .shadow(radius: 10)
                    }
                }
            }
        }.navigationBarHidden(true).preferredColorScheme(.dark)
        
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(saveAction: {})
.previewInterfaceOrientation(.portrait)
    }
}

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
                NavButton(buttonText: "My Armies")
                Divider()
                NavButton(buttonText: "New Army")
            }
        }
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

struct NavButton: View {
    
    let buttonText: String
    
    var body: some View {
        Button(action: {
            
        }) {
            Text(buttonText)
                .font(.system(size: 25))
                .foregroundColor(.black)
                .padding(.all)
        }
        .background(Color(red: 0.9, green: 0.8, blue: 0.3, opacity: 1.0))
        .cornerRadius(25)
        .shadow(radius: 10)
    }
}

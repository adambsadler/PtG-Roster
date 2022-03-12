//
//  ContentView.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import SwiftUI

struct ContentView: View {
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
                Button("My Armies") {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.portraitUpsideDown)
    }
}

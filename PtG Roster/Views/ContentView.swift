//
//  ContentView.swift
//  PtG Roster
//
//  Created by Adam Sadler on 3/12/22.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var navManager: NavManager
    @State private var goToListView: Bool = false
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        NavigationStack(path: $navManager.path) {
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
                    Button {
                        goToListView.toggle()
                    } label: {
                        Text("My Armies")
                            .padding()
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                            .background(.yellow)
                            .cornerRadius(25)
                            .shadow(radius: 10)
                    }
                    Divider()
                    Button {
                        isShowingSheet.toggle()
                    } label: {
                        Text("New Army")
                            .padding()
                            .foregroundColor(.black)
                            .font(.system(size: 25))
                            .background(.yellow)
                            .cornerRadius(25)
                            .shadow(radius: 10)
                    }
                }
                .navigationDestination(isPresented: $goToListView) {
                    ArmyListView()
                }
            }
        }
        .navigationBarHidden(true)
        .sheet(isPresented: $isShowingSheet) {
            CreateArmyView(isShowingSheet: $isShowingSheet)
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(previewContainer)
        .environmentObject(NavManager())
}

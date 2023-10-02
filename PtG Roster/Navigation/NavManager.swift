//
//  NavManager.swift
//  PtG Roster
//
//  Created by Adam Sadler on 10/2/23.
//

import SwiftUI

class NavManager: ObservableObject {
    @Published var path = NavigationPath()
    
    func resetPath() {
        path = NavigationPath()
    }
}

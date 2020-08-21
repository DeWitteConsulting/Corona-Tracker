//
//  Corona_TrackerApp.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/6/20.
//

import SwiftUI

@main
struct Corona_TrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}

//
//  ContentView.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/6/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        DCTabBar().environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

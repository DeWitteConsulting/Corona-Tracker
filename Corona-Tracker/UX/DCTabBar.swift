//
//  DCTabBar.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/6/20.
//

import SwiftUI

public struct DCTabBar: View {
    @EnvironmentObject var viewModel: ViewModel
    
    public var body: some View {
        VStack {
            TabView(selection: $viewModel.selectedTab) {
                ForEach(Tab.allTabs()) {
                    let tab = $0.tab
                    let image = tab.tabImage()
                    let name = tab.tabName()
                    $0.environmentObject(viewModel).tabItem {
                        image
                        name
                    }.tag(tab)
                }
            }
        }
    }
}

struct DCTabBar_Previews: PreviewProvider {
    static var previews: some View {
        DCTabBar()
    }
}

//
//  DCTabView.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/6/20.
//

import SwiftUI

public struct DCTabView: View, Identifiable {
    @State private var searchText = ""
    public var id = UUID()
    @EnvironmentObject var viewModel: ViewModel
    var tab: Tab
    
    public var body: some View {
        tabView()
    }
    
    private func tabView() -> AnyView {
        switch tab {
        case .home:
            return AnyView(HomeView(viewModel: viewModel.homeViewModel))
        case .search:
            return AnyView(SearchView(viewModel: viewModel.searchViewModel))
        case .favorites:
            return AnyView(Text("Favorites"))
        case .settings:
            return AnyView(Text("Settings"))
        }
    }
}

struct DCTabView_Previews: PreviewProvider {
    static var previews: some View {
        DCTabView(tab: .home)
    }
}

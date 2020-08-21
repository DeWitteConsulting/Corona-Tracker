//
//  ViewModelHelpers.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/6/20.
//

import Foundation
import SwiftUI

public enum Tab: Hashable, CaseIterable {
    case home
    case search
    case favorites
    case settings
    
    func tab() -> DCTabView {
        return DCTabView(tab: self)
    }
    
    func tabImage() -> Image {
        switch self {
        case .home: return Image(systemName: "house")
        case .search: return Image(systemName: "magnifyingglass")
        case .favorites: return Image(systemName: "star")
        case .settings: return Image(systemName: "gearshape")
        }
    }
    func tabName() -> Text {
        switch self {
        case .home: return Text("Home")
        case .search: return Text("Search")
        case .favorites: return Text("Favorites")
        case .settings: return Text("Settings")
        }
    }
    
    static func allTabs()-> [DCTabView] {
        var tabs = [DCTabView]()
        for tab in Tab.allCases {
            tabs.append(tab.tab())
        }
        return tabs
    }
}

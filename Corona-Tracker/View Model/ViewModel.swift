//
//  ViewModel.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/6/20.
//

import Foundation
import Combine


final public class ViewModel: ObservableObject {
    
    @Published var selectedTab = Tab.home
    
    @Published var countrySearchText = ""
    
    var searchViewModel = SearchViewModel()
    var homeViewModel = HomeViewModel()
    
    public init(){
    }
}

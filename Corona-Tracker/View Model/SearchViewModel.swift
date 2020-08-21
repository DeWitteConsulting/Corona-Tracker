//
//  SearchViewModel.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/8/20.
//

import Combine
import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    
    var searchPublisher: AnyCancellable?

    @Published var countries: [Country] = [Country]()
    
    init() {
        self.searchPublisher = $searchText
            .receive(on: RunLoop.main)
            .searchForCountries()
            .sink(receiveValue: { [weak self] countries in
                guard let self = self else { return }
                if !(self.searchText.isEmpty) {
                    self.countries = countries.filter { $0.Country!.hasPrefix(self.searchText) }
                } else {
                    self.countries = countries
                }
            })
    }
}

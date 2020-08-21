//
//  CountryDetailViewModel.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/9/20.
//

import Combine
import Foundation

class CountryDetailViewModel: ObservableObject {
    
    var detailPublisher: AnyCancellable?

    @Published var country: Country
    
    init(country: Country) {
        self.country = country
//        self.detailPublisher = $searchText
//            .receive(on: RunLoop.main)
//            .searchForCountries()
//            .sink(receiveValue: { countries in
//                if !self.searchText.isEmpty {
//                    self.countries = countries.filter { $0.Country!.hasPrefix(self.searchText) }
//                } else {
//                    self.countries = countries
//                }
//            })
    }
}

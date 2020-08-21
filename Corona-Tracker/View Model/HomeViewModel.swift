//
//  HomeViewModel.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/9/20.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    
    var searchPublisher: AnyCancellable?
    @Published var summary: Summary = Summary()
    
    init() {
        searchPublisher = $summary
            .getSummary()
            .sink(receiveValue: { [weak self] summary in
                self?.summary = summary
                print("SINK CALLED??")
        })
    }
}

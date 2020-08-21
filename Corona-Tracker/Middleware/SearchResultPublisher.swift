//
//  SearchResultPublisher.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/7/20.
//

import Combine
import Foundation

public enum CoronaAPIEndpoints {
    static let baseURl = URL(string: "https://api.covid19api.com/")
    static let countries = baseURl!.appendingPathComponent("countries")
    static let summary = baseURl!.appendingPathComponent("summary")
}

private func createCountryRequest() -> URLRequest {
    var req = URLRequest(url: CoronaAPIEndpoints.countries)
    req.httpMethod = "GET"
    return req
}

public struct Country: Codable, Hashable {
    public var Country: String?
    public var Slug: String?
    public var ISO2: String?
}

extension Array where Element == Country {
    public var sortedCountries: [Country] {
        self.sorted{ $0.Country ?? "" < $1.Country ?? "" }
    }
}

public struct CountrySearchResultPublisher: Publisher {
    public typealias Output = [Country]
    public typealias Failure = Never
    
    private let publisher: AnyPublisher<[Country], Never>
    
    init<P: Publisher>(_ searchTermPublisher: P)
    where
        P.Output == String,
        P.Failure == Never
    {
        let requestQueue = DispatchQueue(label: "countries-search")
        publisher = searchTermPublisher
            .debounce(for: 0.2, scheduler: requestQueue)
            .map { _ in
                URLSession.shared
                    .dataTaskPublisher(for: createCountryRequest())
                    .map(\.data)
                    .decode(type: [Country].self, decoder: JSONDecoder())
                    .map(\.sortedCountries)
                    .replaceError(with: [])
                    .receive(on: RunLoop.main)
            }
            .switchToLatest()
            .eraseToAnyPublisher()
    }
    
    public func receive<S>(subscriber: S)
        where
            S : Subscriber,
            Self.Failure == S.Failure,
            Self.Output == S.Input
    {
            publisher.subscribe(subscriber)
    }
}

extension Publisher where Output == String, Failure == Never {
    func searchForCountries() -> CountrySearchResultPublisher {
        return CountrySearchResultPublisher(self)
    }
}

//
//  SummaryPublisher.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/9/20.
//

import Combine
import Foundation

private func createSummaryRequest() -> URLRequest {
    var req = URLRequest(url: CoronaAPIEndpoints.summary)
    req.httpMethod = "GET"
    return req
}

//public struct Summary: Codable, Hashable {
//    public var Global: GlobalSummary?
//    public var Countries: [CountrySummary]?
//    public var Date: String?
//}
//
//public struct GlobalSummary: Codable, Hashable {
//    public var NewConfirmed: String?
//    public var TotalConfirmed: String?
//    public var NewDeaths: String?
//    public var TotalDeaths: String?
//    public var NewRecovered: String?
//    public var TotalRecovered: String?
//}
//
//public struct CountrySummary: Codable, Hashable {
//    public var Country: String?
//    public var CountryCode: String?
//    public var Slug: String?
//    public var NewConfirmed: String?
//    public var TotalConfirmed: String?
//    public var NewDeaths: String?
//    public var TotalDeaths: String?
//    public var NewRecovered: String?
//    public var TotalRecovered: String?
//    public var Date: String?
//}


public struct Summary: Codable, Hashable {
    public var Global: Global?
    public var Countries: [CountrySummary]?
    public var Date: String?
}

public struct Global: Codable, Hashable {
    public var NewConfirmed: Int?
    public var TotalConfirmed: Int?
    public var NewDeaths: Int?
    public var TotalDeaths: Int?
    public var NewRecovered: Int?
    public var TotalRecovered: Int?
}

public struct CountrySummary: Codable, Hashable {
    public var Country: String?
    public var CountryCode: String?
    public var Slug: String?
    public var NewConfirmed: Int?
    public var TotalConfirmed: Int?
    public var NewDeaths: Int?
    public var TotalDeaths: Int?
    public var NewRecovered: Int?
    public var TotalRecovered: Int?
    public var Date: String?
}


public struct SummaryPublisher: Publisher {
    public typealias Output = Summary
    public typealias Failure = Never
    
//    fileprivate struct SummaryResponse: Codable, Hashable {
//        private struct GlobalSummaryInt: Codable, Hashable {
//            public var NewConfirmed: Int?
//            public var TotalConfirmed: Int?
//            public var NewDeaths: Int?
//            public var TotalDeaths: Int?
//            public var NewRecovered: Int?
//            public var TotalRecovered: Int?
//        }
//
//        private struct CountrySummaryInt: Codable, Hashable {
//            public var Country: String?
//            public var CountryCode: String?
//            public var Slug: String?
//            public var NewConfirmed: Int?
//            public var TotalConfirmed: Int?
//            public var NewDeaths: Int?
//            public var TotalDeaths: Int?
//            public var NewRecovered: Int?
//            public var TotalRecovered: Int?
//            public var Date: String?
//        }
//
//        private var Global: GlobalSummaryInt?
//        private var Countries: [CountrySummaryInt]?
//        private var Date: String?
//
//        private let summaryInt: GlobalSummaryInt
//
//        var summary: Summary {
//            Summary(Global: Global(NewConfirmed: "\(String(describing: summaryInt.NewConfirmed))", TotalConfirmed: <#T##String?#>, NewDeaths: <#T##String?#>, TotalDeaths: <#T##String?#>, NewRecovered: <#T##String?#>, TotalRecovered: <#T##String?#>), Countries: <#T##[CountrySummary]?#>, Date: <#T##String?#>)
//        }
//    }
    

    
    private let publisher: AnyPublisher<Summary, Never>
    
    init<P: Publisher>(_ summaryPublisher: P)
    where
        P.Output == Summary,
        P.Failure == Never
    {
        publisher = URLSession.shared
                    .dataTaskPublisher(for: createSummaryRequest())
                    .map(\.data)
                    .decode(type: Summary.self, decoder: JSONDecoder())
                    .replaceError(with: Summary())
                    .receive(on: RunLoop.main)
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

extension Publisher where Output == Summary, Failure == Never {
    func getSummary() -> SummaryPublisher {
        return SummaryPublisher(self)
    }
}

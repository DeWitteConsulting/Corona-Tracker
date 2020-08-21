//
//  Publishers+Extensions.swift
//  Corona-Tracker
//
//  Created by Jeff DeWitte on 7/10/20.
//

import Combine
import Foundation

extension Publishers {
    
    // MARK: - Data Publisher
    struct DataPublisher: Publisher {
        typealias Output = Data
        typealias Failure = Error
        
        private let urlRequest: URLRequest
        
        init(urlRequest: URLRequest) {
            self.urlRequest = urlRequest
        }
        
        func receive<S>(subscriber: S) where S : Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
            let subscription = DataSubscription(request: urlRequest, subscriber: subscriber)
            subscriber.receive(subscription: subscription)
        }
    }
    
    // MARK: - Data Publisher
    class DataSubscription<S: Subscriber>: Subscription where S.Input == Data, S.Failure == Error {
        
        private let session = URLSession.shared
        private let request: URLRequest
        private var subscriber: S?
        
        init(request: URLRequest, subscriber: S) {
            self.request = request
            self.subscriber = subscriber
            sendRequest()
        }
        
        func request(_ demand: Subscribers.Demand) {
            //TODO: - optionally Adjust The Demand
        }
        
        func cancel() {
            subscriber = nil
        }
        
        private func sendRequest() {
            guard let subscriber = subscriber else { return }
            session.dataTask(with: request) { (data, _, error) in
                _ = data.map(subscriber.receive)
                _ = error.map { subscriber.receive(completion: Subscribers.Completion.failure($0)) }
            }.resume()
        }
        
    }
}

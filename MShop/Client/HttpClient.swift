//
//  HttpClient.swift
//  MShop
//
//  Created by Sravanthi Chinthireddy on 14/03/24.
//

import Foundation
import Combine

enum NetworkError: Error {
    case customError
}

class HttpClient {
    func fetchProducts() -> AnyPublisher<[Product], Error> {
        guard let url = URL(string: "https://dummyjson.com/products") else
        {
            return Fail(error: NetworkError.customError)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: ProductList.self, decoder: JSONDecoder())
            .map(\.products)
            .receive(on: DispatchQueue.main)
            .catch { error -> AnyPublisher<[Product], Error> in
                return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}

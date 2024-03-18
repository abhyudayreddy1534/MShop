//
//  MShopTests.swift
//  MShopTests
//
//  Created by Sravanthi Chinthireddy on 18/03/24.
//

import XCTest
import Combine

final class MShopTests: XCTestCase {

    var cancellables: Set<AnyCancellable> = []

    func testFetchProducts() throws {
        let httpClient = HttpClient()
        let expectation = XCTestExpectation(description: "Received Products")
        
        httpClient.fetchProducts().sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                XCTFail("Request failed with error: \(error)")
            }
        } receiveValue: { products in
            XCTAssert(products.count > 0, "Products")
            expectation.fulfill()
        }.store(in: &cancellables)
        wait(for: [expectation], timeout: 4.0)
    }

    

}

//
//  ProductListViewModel.swift
//  MShop
//
//  Created by Sravanthi Chinthireddy on 14/03/24.
//

import Foundation
import Combine

class ProductListViewModel: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published var isLoadingCompleted: Bool = false
    
    private var cancellables: Set<AnyCancellable> = []
    
    let httpClient: HttpClient
    
    
    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }
    
    func loadProducts() {
        httpClient.fetchProducts()
            .sink {[weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoadingCompleted = true
                    print("UI Update")
                case .failure(let error):
                    self?.isLoadingCompleted = false
                    print(error)
                }
            } receiveValue: { [weak self] products in
                self?.products = products
            }
            .store(in: &cancellables)
        
    }
}

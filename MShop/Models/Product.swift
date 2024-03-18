//
//  Product.swift
//  MShop
//
//  Created by Sravanthi Chinthireddy on 14/03/24.
//

import Foundation

struct ProductList: Decodable {
    let products: [Product]
}

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: URL?
    let images: [URL?]
    
    var formattedPrice :String {
        let f = NumberFormatter()
        f.numberStyle = .currency
        return f.string(from: NSNumber(value: price)) ?? ""
    }
}

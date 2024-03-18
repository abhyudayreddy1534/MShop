//
//  ContentView.swift
//  MShop
//
//  Created by Sravanthi Chinthireddy on 14/03/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject private var viewModel = ProductListViewModel(httpClient: HttpClient())
    
    var body: some View {
        VStack {
            if viewModel.isLoadingCompleted {
                List(viewModel.products) { product in
                    ProductListItemView(product: product)
                }
            }
            else {
                ListPlaceholderView()
            }
        }
        .navigationTitle("Mega Cart")
        .onAppear(perform: {
            viewModel.loadProducts()
        })
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}

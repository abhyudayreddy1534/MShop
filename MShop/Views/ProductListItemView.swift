//
//  ProductListItemView.swift
//  MShop
//
//  Created by Sravanthi Chinthireddy on 14/03/24.
//

import SwiftUI

struct ProductListItemView: View {
    @State var product: Product
    
    var body: some View {
        HStack {
            VStack {
                AsyncImage(url: product.thumbnail) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                } placeholder: {
                    ProgressView()
            }
                Text(product.formattedPrice)
                    .font(.title3)
                    .fontWeight(.medium)
            }
            
            VStack(alignment: .leading, content: {
                Text(product.title)
                    .font(.title3)
                    .fontWeight(.bold)
                    .lineLimit(2)
                
                Text(product.description)
                    .font(.footnote)
                    .foregroundStyle(Color(.systemGray))
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                
                VStack(alignment:.leading) {
                    GroupBox {
                        Text(product.brand)
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    GroupBox {
                        Text(product.category)
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                }

                
            })
            

        }
        .padding(3)
//        Divider()
    }
}

#Preview {
    ProductListItemView(product: Product(id: 1,
                                         title: "iPhone 9",
                                         description: "An apple mobile which is nothing like apple",
                                         price: 549,
                                         discountPercentage: 12.96,
                                         rating: 4.69,
                                         stock: 94,
                                         brand: "Apple",
                                         category: "Smartphones",
                                         thumbnail: URL(string:"https://cdn.dummyjson.com/product-images/1/thumbnail.jpg")!,
                                         images: [URL(string:"https://cdn.dummyjson.com/product-images/1/thumbnail.jpg")!,
                                                  URL(string:"https://cdn.dummyjson.com/product-images/1/thumbnail.jpg")!]))
}

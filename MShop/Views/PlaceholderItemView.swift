//
//  PlaceholderItemView.swift
//  MShop
//
//  Created by Sravanthi Chinthireddy on 14/03/24.
//

import SwiftUI

struct PlaceholderItemView: View {
    @State var isAnimating = false
    
    
    var body: some View {
        ZStack {
            HStack {
                Rectangle()
                    .fill(Color(.systemGray5))
                    .frame(width: 100, height: 100)
                    .padding(10)
                VStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .frame(height: 40)
                    
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .frame(height: 20)
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .frame(height: 20)
                }
                .padding([.top, .bottom, .trailing], 10)
                .padding(.leading, 0)
            }
            .border(Color(.systemGray5), width: 2)
            .padding(5)
            
            LinearGradient(colors: [.white.opacity(0.1),
                                    .white.opacity(0.3),
                                    .white.opacity(0.8),
                                    .white.opacity(0.5),
                                    .white.opacity(0.3),
                                    .white.opacity(0.1)],
                           startPoint: .leading,
                           endPoint: .trailing)
            .offset(x: isAnimating ? 500 : -500)
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
            .onAppear(perform: {
                isAnimating = true
            })
        }
    }
}

#Preview {
    PlaceholderItemView()
}

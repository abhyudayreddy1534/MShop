//
//  ListPlaceholderView.swift
//  MShop
//
//  Created by Sravanthi Chinthireddy on 14/03/24.
//

import SwiftUI

struct ListPlaceholderView: View {
    var body: some View {
        ForEach(1...5, id:\.self) {_ in 
            PlaceholderItemView()
        }
    }
}

#Preview {
    ListPlaceholderView()
}

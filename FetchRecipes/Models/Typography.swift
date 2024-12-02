//
//  Typography.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/19/24.
//

import SwiftUI

struct SmallTitle: View {
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text).font(.system(size: 18, weight: .regular)).multilineTextAlignment(.center)
    }
}

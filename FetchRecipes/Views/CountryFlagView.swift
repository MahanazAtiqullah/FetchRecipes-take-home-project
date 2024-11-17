//
//  CountryFlagView.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/8/24.
//

import SwiftUI

struct CountryFlagView: View {
    
    var country: CountryFlags
    
    var body: some View {
        Text(country.asEmojiString())
    }
    
}

#Preview {
    CountryFlagView(country: (CountryFlags.Malaysian))
}

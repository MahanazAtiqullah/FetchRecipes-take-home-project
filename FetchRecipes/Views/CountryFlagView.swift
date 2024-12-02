//
//  CountryFlagView.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/8/24.
//

import SwiftUI

struct CountryFlagView: View {
    
    var country: CountryFlags
    
    init(country: CountryFlags) {
        self.country = country
    }
    
    init(country: String) {
        self.country = CountryFlags(forCountry: country)
    }
    
    var body: some View {
        Text(country.asEmojiString()).font(.system(size: 30))
    }
    
}

#Preview {
    CountryFlagView(country: (CountryFlags.Malaysian))
}

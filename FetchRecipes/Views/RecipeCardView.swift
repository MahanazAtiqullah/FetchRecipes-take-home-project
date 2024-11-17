//
//  RecipeCardView.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/10/24.
//

import SwiftUI

struct RecipeCardView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 10), style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).foregroundColor(.white).shadow(radius: 5)
            VStack {
                HStack {
                    nameView
                    Spacer()
                    CountryFlagView(country: CountryFlags(forCountry: recipe.cuisine))
                }
                HStack {
                    Text("photoSmol: \(recipe.photo_url_small ?? "nil")")
                    Spacer()
                    Text("photoBig: \(recipe.photo_url_large ?? "nil")")
                }
                HStack {
                    Text("sourceurl: \(recipe.source_url ?? "nil")")
                    Spacer()
                    Text("youtube: \(recipe.youtube_url ?? "nil")")
                }
                Text("uuid: \(recipe.uuid)")
            }
        }
    }
    
    var nameView: some View {
        Text(recipe.name)
    }
}

#Preview {
    RecipeCardView(recipe: Recipe(cuisine: "French", name: "Macaroon", photo_url_large: "large.com", photo_url_small: "small.com", uuid: "12345", source_url: "source.com", youtube_url: "youtube.com"))
}

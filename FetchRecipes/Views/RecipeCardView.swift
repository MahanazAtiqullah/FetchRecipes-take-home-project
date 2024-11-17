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
                    smallPhotoView
                }
                HStack {
                    Text("youtube: \(recipe.youtube_url ?? "nil")")
                    Spacer()
                    sourceLinkView
                }
                Text("uuid: \(recipe.uuid)")
            }
        }
    }
    
    var nameView: some View {
        Text(recipe.name)
    }
    
    #warning("handle nil cases")
    var smallPhotoView: some View {
        AsyncImage(url: URL(string: recipe.photo_url_small ?? "nil")){ image in
            image.resizable()
        } placeholder: {
            Color.red
        }
        .frame(width: 128, height: 128)
        .clipShape(.rect(cornerRadius: 25))
    }
    
    var sourceLinkView: some View {
        Link(destination: URL(string: recipe.source_url ?? "nil")!) {
            Image(systemName: SFSymbols.safari.rawValue)
        }
    }
    
//    as the large photo is the same as the small photo, and the small photos are big enough, we will not require this.
//    var largePhotoView: some View {
//        AsyncImage(url: URL(string: recipe.photo_url_large ?? "nil")){ image in
//            image.resizable()
//        } placeholder: {
//            Color.red
//        }
//        .frame(width: 150, height: 150)
//        .clipShape(.rect(cornerRadius: 25))
//    }
}

#Preview {
    RecipeCardView(recipe: Recipe(cuisine: "French", name: "Macaroon", photo_url_large: "large.com", photo_url_small: "small.com", uuid: "12345", source_url: "source.com", youtube_url: "youtube.com"))
}

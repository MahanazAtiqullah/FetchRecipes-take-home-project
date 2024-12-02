//
//  RecipeCardView.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/10/24.
//

import SwiftUI
import YouTubePlayerKit

struct RecipeCardView: View {
    
    @ObservedObject var viewModel: RecipeCardViewModel
    
    @State var recipe: Recipe
    
    let padding: CGFloat = 10
    let screenWidth = UIScreen.main.bounds.size.width
    let heightMultiplier: CGFloat = 1.75
    
    init(recipe: Recipe) {
        self.recipe = recipe
        self.viewModel = RecipeCardViewModel(recipe: recipe)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 30)/*.stroke(Color(UIColor.tertiarySystemBackground), lineWidth: 3.0)*/.foregroundColor(Color(UIColor.systemBackground)).shadow(radius: 5)
                VStack(alignment: .center) {
                    ZStack(alignment: .topLeading) {
                        smallPhotoView
                        VStack{
                            HStack {
                                CountryFlagView(country: recipe.cuisine).padding(5)
                                Spacer()
                            }
                            Spacer()
                            
                        }
                    }.frame(width: cellWidth, height: cellWidth).padding(padding)
                    SmallTitle(recipe.name)
                    Spacer()
                    HStack {
                        if (recipe.source_url == nil) {
                            sourceStaleView.padding(padding)
                        } else {
                            sourceLinkView.padding(padding)
                        }
                        Spacer()
                        if (recipe.youtube_url == nil) {
                            youtubeStaleView.padding(padding)
                        } else {
                            youtubeLinkView.padding(padding)
                        }
                    }
                }
            }
        }.frame(width: cellWidth, height: cellWidth*heightMultiplier)
    }
    
    var nameView: some View {
        SmallTitle(recipe.name)
    }
    
    var smallPhotoView: some View {
        AsyncImage(url: viewModel.createUrl(fromString: recipe.photo_url_small)) { image in
            image.resizable()
        } placeholder: {
            placeHolder
        }
        .frame(width: cellWidth, height: cellWidth)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        //.aspectRatio(contentMode: .fill)  // Ensures it fills the square
        //.clipped()
    }
    
    var cellWidth: CGFloat {
        ((screenWidth)/2)-padding*4
    }
  
    var sourceLinkView: some View {
        Link(destination: URL(string: recipe.source_url ?? "nil")!) {
            Image(systemName: SFSymbols.sourceLink.rawValue).resizable()
        }.frame(width: 25, height: 25).aspectRatio(contentMode: .fill)
    }
    
    var sourceStaleView: some View {
        Image(systemName: SFSymbols.sourceLink.rawValue).resizable().frame(width: 25, height: 25).aspectRatio(contentMode: .fill).foregroundColor(.gray)
    }
    
    var placeHolder: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/).foregroundColor(.gray)
            Image(systemName: SFSymbols.imagePlaceholder.rawValue).resizable().foregroundStyle(.background).padding(10)
        }
        
    }
    
    var youtubeLinkView: some View {
        Link(destination: URL(string: recipe.source_url ?? "nil")!) {
            Image(systemName: SFSymbols.youtube.rawValue).resizable()
        }.frame(width: 30, height: 20).aspectRatio(contentMode: .fill).foregroundColor(.red)
    }
    
    var youtubeStaleView: some View {
        Image(systemName: SFSymbols.youtube.rawValue).resizable().frame(width: 30, height: 20).aspectRatio(contentMode: .fill).foregroundColor(.gray)
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
    RecipeCardView(recipe: Recipe(cuisine: "French", name: "Macaroon", photo_url_large: "large.com", photo_url_small: "small.com", uuid: "12345", source_url: "source.com", youtube_url: "https://www.youtube.com/watch?v=eHaev5gmVSo"))
}

/*

 */

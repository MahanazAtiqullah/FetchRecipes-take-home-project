//
//  RecipesCollectionView.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/10/24.
//

import SwiftUI

struct RecipesCollectionView: View {
    
    @ObservedObject var viewModel: RecipesCollectionViewModel
    
    init() {
        self.viewModel = RecipesCollectionViewModel()
    }
    
    var body: some View {
        if (viewModel.loading) {
            loadingView
        } else if (viewModel.recipes == nil) {
            errorView
        } else if (viewModel.recipes!.recipes.isEmpty) {
            emptyResultView
        } else {
            ScrollView {
                VStack {
                    ForEach(viewModel.recipes!.recipes) { recipe in
                        RecipeCardView(recipe: recipe)
                    }
                }.padding(10)
            }
//            .accessibilityIdentifier(ElementIdentifiers.__.rawValue)
        }
    }
    
    // view displayed for when there is an error with appropriate error message
    var errorView: some View {
        VStack(){
            Spacer()
            Text(viewModel.error?.errorMessage ?? "Error: error information unavailable. Please contact support").multilineTextAlignment(.center)
            Spacer()
        }.padding(20)
//          .accessibilityIdentifier(ElementIdentifiers.errorView.rawValue)
    }
    
    // view displayed when there is no error, but ther ewere no stocks to be listed
    var emptyResultView: some View {
        VStack(){
            Spacer()
            Text(/*ElementIdentifiers.emptyListMessage.rawValue*/"Empty").multilineTextAlignment(.center) // localized to allow consistency with test queries
            Spacer()
        }.padding(20)
//            .accessibilityIdentifier(ElementIdentifiers.emptyResultView.rawValue)
    }
    
    // progress view for when loading stocks
    var loadingView: some View {
        VStack(){
            Spacer()
            ProgressView("Loading...")
            Spacer()
        }.padding(20)
    }
}


#Preview {
    RecipesCollectionView()
}
//
//  RecipeCardViewModel.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/17/24.
//

import Foundation

extension RecipeCardView {
    @MainActor class RecipeCardViewModel: ObservableObject {
        
        @Published var recipe: Recipe
        
        init(recipe: Recipe) {
            self.recipe = recipe
        }
        
        func createUrl(fromString: String?) -> URL? {
            guard let unwrappedString = fromString else { return nil }
            return URL(string: unwrappedString)
        }
        
    }
}

//
//  RecipeCardViewModel.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/17/24.
//

import Foundation

extension RecipeCardView {
    @MainActor class RecipeCardViewModel: ObservableObject {
        
        func createImageURL(forString: String?) -> URL? {
            guard let unwrappedString = forString else { return nil }
            return URL(string: unwrappedString)
        }
    }
}

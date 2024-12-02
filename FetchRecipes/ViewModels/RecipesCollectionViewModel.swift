//
//  RecipesCollectionViewModel.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/10/24.
//

import Foundation

extension RecipesCollectionView {
    @MainActor class RecipesCollectionViewModel: ObservableObject {
        
        let networkEngine = NetworkEngine()
        
        @Published var recipes: Recipes? // recipes to be listed
        
        var error: NetworkError?
        
        @Published var loading = false
        
        init() {
            self.getRecipes()
        }
        
        /// `Description:` makes network call request and sets json object or error message depending on success or failure. sets loading state at initiation and end of network call
        func getRecipes() {
            self.loading = true
            networkEngine.request(endpoint: RecipeRequestEndpoint.main) { (result: Result<Recipes, NetworkError>) in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.recipes = response
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.error = error
                    }
                }
                DispatchQueue.main.async {
                    self.loading = false
                }
            }
        }
        
        func refresh() {
            networkEngine.request(endpoint: RecipeRequestEndpoint.main) { (result: Result<Recipes, NetworkError>) in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.recipes = response
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self.error = error
                    }
                }
            }
        }
        
    }
}

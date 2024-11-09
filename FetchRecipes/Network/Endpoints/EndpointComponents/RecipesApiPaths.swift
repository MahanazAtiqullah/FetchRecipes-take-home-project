//
//  RecipesApiPaths.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/8/24.
//

import Foundation

// Api paths for the recipe apis. Allows more paths to be added in easily
enum RecipesApiPaths: String {
    case main = "/recipes.json"
    case malformed = "/recipes-malformed.json"
    case empty = "/recipes-empty.json"
}

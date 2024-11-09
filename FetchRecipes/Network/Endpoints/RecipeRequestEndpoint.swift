//
//  RecipeRequestEndpoint.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/8/24.
//

import Foundation

/// Custom endpoint for retrieving Recipes.
/// Has a case for 3 different URLs depending on the list wanting to be displayed.
/// This is one component that connects and handles the selection as well as its corresponding URL for efficient state handling
/// Allows buttons and their selections to be linked for efficiency and ease of logic
enum RecipeRequestEndpoint: RequestEndpoint {
    
    case main, empty, malformed
    
    // URL COMPONENTS
    var method: HTTPMethod {
        HTTPMethod.get
    }
    
    var scheme: RequestScheme {
        return RequestScheme.https
    }
    
    var baseURL: BaseURL {
        BaseURL.googleApi
    }
    
    // provides path for appropriate URL
    var path: String {
        switch self {
            case .main:
                RecipesApiPaths.main.rawValue
            case .empty:
                RecipesApiPaths.empty.rawValue
            case .malformed:
                RecipesApiPaths.malformed.rawValue
        }
    }
    
//    // Provides corresponding button text
//    var rawValue: String {
//        switch self {
//            case .main:
//                "Main"
//            case .empty:
//                "Empty"
//            case .malformed:
//                "Malformed"
//        }
//    }
    
    
}

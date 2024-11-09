//
//  Recipes.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/8/24.
//

import Foundation

/// Recipe JSON object
struct Recipe: Codable, Identifiable {
    var id: Int { uuid.hashValue }  /// id used for `Identifiable` protocol compliance based off of object's given unique uuid
    var cuisine: String             /// The cuisine of the recipe.
    var name: String                /// The name of the recipe.
    var photo_url_large: String?    /// The URL of the recipes’s full-size photo.
    var photo_url_small: String?    /// The URL of the recipes’s small photo. Useful for list view.
    var uuid: String                /// The unique identifier for the receipe. Represented as a UUID.
    var source_url: String?         /// The URL of the recipe's original website.
    var youtube_url: String?        /// The URL of the recipe's YouTube video.
    
}

/// JSON list object of the `Recipe` JSON object
struct Recipes: Codable {
    var recipes: [Recipe]
}

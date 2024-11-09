//
//  NetworkError.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/8/24.
//

import Foundation

/// NetworkError enum
/// Holds all cases of potential network errors as well as their appropriate UI error messages to be used for error handling
enum NetworkError: Error {
    case invalidURLComponents
    case invalidURL
    case badStatusCode
    case decodingError
    case dataFailure
    
    var errorMessage: String {
        switch self {
        case .invalidURLComponents:
            "Sorry! The request formatting failed. Please contact support."
        case .invalidURL:
            "Sorry! The URL request made was invalid. Please contact support."
        case .badStatusCode:
            "Sorry! The URL returned a bad status code. Please contact support."
        case .decodingError:
            "Sorry! The data provided by the api was malformed. Please contact support."
        case .dataFailure:
            "Sorry! The data in the URL is not present. Please contact support."
        }
    }
}

//
//  RequestEndpoint.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/8/24.
//

import Foundation

/// Generic class for RequestEndpoint, allowing more types of url requests to be built on top of it
protocol RequestEndpoint {

    var method: HTTPMethod { get }
    
    var scheme: RequestScheme { get }
    
    var baseURL: BaseURL { get }
    
    var path: String { get }
    
}

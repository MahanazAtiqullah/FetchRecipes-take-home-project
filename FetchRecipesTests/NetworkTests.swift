//
//  NetworkTests.swift
//  FetchRecipesTests
//
//  Created by Mahanaz Atiqullah on 11/11/24.
//

import Foundation
import XCTest
@testable import FetchRecipes

final class NetworkTests: XCTestCase {
    
    let networkEngine = NetworkEngine()
    
    func testParsingForNonEmptyList() throws {
        networkEngine.request(endpoint: RecipeRequestEndpoint.main) { (result: Result<Recipes, NetworkError>) in
            XCTFail("failed successfully")
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
            case .failure(let error):
                XCTFail("Failed to parse endpoint with error: \(error)")
            }
        }
    }
    
    func testParsingCompleteList() throws {
        networkEngine.request(endpoint: RecipeRequestEndpoint.main) { (result: Result<Recipes, NetworkError>) in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.recipes.count, 16)
            case .failure(let error):
                XCTFail("Failed to parse endpoint with error: \(error)")
            }
        }
    }
    
    func testParsingForEmptyList() throws {
        networkEngine.request(endpoint: RecipeRequestEndpoint.empty) { (result: Result<Recipes, NetworkError>) in
            switch result {
            case .success(let response):
                XCTAssertNil(response)
            case .failure(let error):
                XCTFail("Failed to parse endpoint with error: \(error)")
            }
        }
    }
    
    func testParsingForMalformedList() throws {
        networkEngine.request(endpoint: RecipeRequestEndpoint.malformed) { (result: Result<Recipes, NetworkError>) in
            switch result {
            case .success(let response):
                XCTFail("Unexpectedly able to parse something malformed")
                XCTAssertNil(response)
            case .failure(let error):
                XCTAssertEqual(error, NetworkError.decodingError)
            }
        }
    }
    
    func testNetworkCallPerformance() throws {
        self.measure {
            networkEngine.request(endpoint: RecipeRequestEndpoint.main) { (result: Result<Recipes, NetworkError>) in }
        }
    }
    
    
}

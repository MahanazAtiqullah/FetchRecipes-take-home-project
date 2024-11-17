//
//  NetworkEngine.swift
//  FetchRecipes
//
//  Created by Mahanaz Atiqullah on 11/8/24.
//

import Foundation

/*
 This class handles the api call to pull JSON data and handles and returns appropriate errors
 */
class NetworkEngine {
    /// `Description:`Generic network request function for any JSON data type
    ///
    /// - `Parameters:`
    ///     -  `endpoint:`RequestEndpoint with components of the url
    ///     -  `onComplete:`closure that is called upon success or failure with appropriate response or Error type, respectively
    func request<T: Codable>(endpoint: RequestEndpoint, onComplete: @escaping (Result<T, NetworkError>) -> ()) {
        
        // set up components of url
        var  urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme.rawValue
        urlComponents.host = endpoint.baseURL.rawValue
        urlComponents.path = endpoint.path
        
        // create url
        guard let url = urlComponents.url else {
            onComplete(.failure(NetworkError.invalidURLComponents))
            return
        }
        // create url request
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method.rawValue

        // create session and start dataTask
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            // error handling for invalid URL
            guard error == nil else {
                onComplete(.failure(NetworkError.invalidURL))
                print("Error: \(error?.localizedDescription ?? "unknown")")
                return
            }
            
            // error handling for faulty response
            guard let response = response as? HTTPURLResponse, 200...299 ~= response.statusCode else {
                print(response)
                onComplete(.failure(NetworkError.badStatusCode))
                return
            }
            
            // error handling for data failure
            guard let data = data else {
                onComplete(.failure(NetworkError.dataFailure))
                return
            }

            // error handling for parsing failure
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                onComplete(.failure(NetworkError.decodingError))
                return
            }

            // success and returning response
            onComplete(.success(decodedResponse))
            
        }
        dataTask.resume()
    }
    
}

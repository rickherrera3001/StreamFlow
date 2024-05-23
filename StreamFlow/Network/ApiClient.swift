//
//  ApiClient.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.
//

import Foundation

// APIClient
class APIClient {
    static let shared = APIClient()
    let headers = [
                "X-RapidAPI-Key": "d7b4708509msh6675f58eb66caadp182309jsn2e6e7156ee4e",
                "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
            ]
    
    
    private let baseURL = URL(string: "https://moviesdatabase.p.rapidapi.com/titles/x/upcoming")!
    
    private init() {}
    
    func fetchMovies(page: Int, completion: @escaping (Result<MovieModel, Error>) -> Void) {
        var urlComponents = URLComponents(url: baseURL.appendingPathComponent("movies"), resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [
            URLQueryItem(name: "page", value: "\(page)")
        ]
        
        guard let url = urlComponents?.url else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(APIError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(APIError.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let movieModel = try decoder.decode(MovieModel.self, from: data)
                completion(.success(movieModel))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}

// APIError
enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case noData
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .invalidResponse:
            return "The server response is invalid."
        case .noData:
            return "No data received from the server."
        case .decodingError:
            return "Failed to decode the data."
        }
    }
}

//https://moviesdatabase.p.rapidapi.com/titles/x/upcoming



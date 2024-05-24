//
//  ApiClient.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.
//


import Foundation
class APIClient {
    
    func getDataUpcoming(completion: @escaping (Result<MovieModel,Error>) -> Void) {
        let headers = [
            "X-RapidAPI-Key": "c2bcfa61f1mshf2abcf111b8af04p11138ejsnd5ae171d439b",
            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        ]
        
        var request = URLRequest(url:URL(string: "https://moviesdatabase.p.rapidapi.com/titles/x/upcoming")!, timeoutInterval: Double.infinity)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            //print(String(data: data, encoding: .utf8)!)
            do {
                let result = try JSONDecoder().decode(MovieModel.self, from: data)
                completion(.success(result))
            } catch {
                print("Error decoding JSON:\(error)")
                completion(.failure(error))
            }
            
        }.resume()
        
    }
}




/*import Foundation

class APIClient {
    static let shared = APIClient()
    let headers = [
        "X-RapidAPI-Key": "d7b4708509msh6675f58eb66caadp182309jsn2e6e7156ee4e",
        "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
    ]
    
    private let baseURL = URL(string: "https://moviesdatabase.p.rapidapi.com/titles/x/upcoming")!
    
    private init() {}
    
    func fetchMovies(page: Int, completion: @escaping (Result<MovieModel, Error>) -> Void) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [
            URLQueryItem(name: "page", value: "\(page)")
        ]
        
        guard let url = urlComponents?.url else {
            completion(.failure(APIError.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
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
                completion(.failure(APIError.decodingError))
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
}*/

//https://moviesdatabase.p.rapidapi.com/titles/x/upcoming



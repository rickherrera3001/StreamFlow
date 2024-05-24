//
//  ApiClient.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.

import Foundation

class APIClient {
    
    func getDataUpcoming(completion: @escaping (Result<MovieModel,Error>) -> Void) {
        let headers = [
            "X-RapidAPI-Key": "c2bcfa61f1mshf2abcf111b8af04p11138ejsnd5ae171d439b",
            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
        ]
        
        let request = URLRequest(url: URL(string: "https://moviesdatabase.p.rapidapi.com/titles/x/upcoming")!,
                                 timeoutInterval: Double.infinity)
        
        fetchMovies(with: request, headers: headers, completion: completion)
    }
    
    // Método común para hacer solicitudes de películas
    private func fetchMovies(with request: URLRequest, headers: [String: String], completion: @escaping (Result<MovieModel, Error>) -> Void) {
        var request = request
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                if let error = error {
                    print("Error: \(error)")
                    completion(.failure(error))
                }
                return
            }
            
            do {
                let result = try JSONDecoder().decode(MovieModel.self, from: data)
                completion(.success(result))
            } catch {
                print("Error decoding JSON: \(error)")
                completion(.failure(error))
            }
        }.resume()
    }
}



// Nuevo método para obtener películas por género
//    func getDataByGenre(genre: String, completion: @escaping (Result<MovieModel, Error>) -> Void) {
//        let headers = [
//            "X-RapidAPI-Key": "c2bcfa61f1mshf2abcf111b8af04p11138ejsnd5ae171d439b",
//            "X-RapidAPI-Host": "moviesdatabase.p.rapidapi.com"
//        ]
//
//        // Modifica la URL para incluir el género
//        var components = URLComponents(string: "https://moviesdatabase.p.rapidapi.com/titles/x/\(genre.lowercased())")
//        components?.queryItems = [URLQueryItem(name: "genre", value: genre)]
//
//        guard let url = components?.url else {
//            print("Invalid URL")
//            return
//        }
//
//        let request = URLRequest(url: url, timeoutInterval: Double.infinity)
//
//        fetchMovies(with: request, headers: headers, completion: completion)
//    }

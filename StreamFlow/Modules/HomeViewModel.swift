//
//  HomeViewModel.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.
//

import Foundation
import Combine

class MoviesViewModel: ObservableObject {
    @Published var movies: [Movies] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private var cancellables = Set<AnyCancellable>()
    
    func fetchMovies(page: Int) {
        isLoading = true
        errorMessage = nil
        
        APIClient.shared.fetchMovies(page: page) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let movieModel):
                    self?.movies = movieModel.results ?? []
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}



// 3 publiser
// 2 funciones 

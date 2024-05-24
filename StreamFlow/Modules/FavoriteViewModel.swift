//
//  FavoriteViewModel.swift
//  StreamFlow
//
//  Created by daniel ortiz millan on 22/05/24.
//

import Foundation

// Modelo de película
struct MovieFav: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let poster: String // URL or name of the image
}

class FavoritesB: ObservableObject {
    @Published var favoriteMovies: [MovieFav]
    
    init() {
        // Puedes inicializar con películas favoritas predefinidas si lo deseas
        self.favoriteMovies = []
    }
    
    // Método para agregar una película a favoritos
    func addFavorite(movie: MovieFav) {
        if !favoriteMovies.contains(movie) {
            favoriteMovies.append(movie)
        }
    }
    
    // Método para eliminar una película de favoritos
    func removeFavorite(movie: MovieFav) {
        if let index = favoriteMovies.firstIndex(of: movie) {
            favoriteMovies.remove(at: index)
        }
    }
    
    // Método para verificar si una película está en favoritos
    func isFavorite(movie: MovieFav) -> Bool {
        return favoriteMovies.contains(movie)
    }
}



//
//  FavoritesView.swift
//  StreamFlow
//
//  Created by daniel ortiz millan on 22/05/24.
//

import SwiftUI

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let poster: String // URL or name of the image
}

struct FavoritesView: View {
    
    @State private var favoriteMovies: [Movie] = []
    
    let movies = [
        Movie(title: "Movie 1", poster: "poster1"),
        Movie(title: "Movie 2", poster: "poster2"),
        Movie(title: "Movie 3", poster: "poster3"),
        Movie(title: "Movie 4", poster: "poster4")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color(red: 18/255, green: 31/255, blue: 61/255).edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text(" My favorite movies")
                        .italic()
                        .foregroundColor(.green)
                        .font(.system(size: 26))
                        .fontWeight(.bold)
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                }
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(movies) { movie in
                            VStack {
                                ZStack {
                                    Circle()
                                        .foregroundColor(.blue)
                                        .frame(width: 50, height: 50)
                                    Image(movie.poster)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 40, height: 40)
                                        .clipShape(Circle())
                                }
                                
                                Text(movie.title)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                            .onTapGesture {
//                                if !favoriteMovies.contains(movie) {
                                    favoriteMovies.append(movie)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 20)
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(favoriteMovies) { movie in
                            VStack {
                                Image(movie.poster)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 80, height: 80)
                                    .clipShape(Circle())
                                    .padding(5)
                                Text(movie.title)
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            }
                            .padding(5)
                            .background(Color.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .frame(height: 120)
            }
        }
    }


#Preview {
    FavoritesView()
}




/*import SwiftUI


// Modelo de película
struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let poster: String // URL or name of the image
}

struct FavoritesView: View {
    
    // Lista de películas de ejemplo
    let movies = [
        Movie(title: "Movie 1", poster: "poster1"),
        Movie(title: "Movie 2", poster: "poster2"),
        Movie(title: "Movie 3", poster: "poster3"),
        Movie(title: "Movie 4", poster: "poster4")
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            // color de fondo
            Color(red: 18/255, green: 31/255, blue: 61/255).ignoresSafeArea()
                            .edgesIgnoringSafeArea(.all) // Ignora los márgenes seguros para cubrir toda la pantalla
            
            VStack {
                HStack {
                        Text(" My favorite movies")
                        .italic()
//                        .font(.custom("YourFontName", size: 24))
                        .foregroundColor(.green) //color del texto
                        .font(.system(size: 26))//tamaño del texto
                        .fontWeight(.bold) // texto negrita
                    Image(systemName: "heart.fill")
                        .foregroundColor(.red)
                    }
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 85) {
                        ForEach(movies) { movie in
                            
                            VStack {
                                
                                // Reemplaza el nombre de la imagen con tu imagen real
                                Image(movie.poster)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 150)
                                    .clipped()
                                    .cornerRadius(10)
                                    .shadow(radius: 5)
                                
                                Text(movie.title)
                                    .font(.headline)
                                    .padding(.top, 30)
                                    .foregroundColor(.primary)
                            }
                            .padding()
                            .background(Color.white)
                            .cornerRadius(30)
                            .shadow(color: Color.black.opacity(1), radius: 15, x: 15, y: 15)
                        }
                    }
                    .padding(.horizontal, 10) // Padding horizontal para que la cuadrícula no toque los bordes de la pantalla
                    .padding(.vertical, 50) // Padding vertical si deseas espacio adicional en la parte superior e inferior
                    //                .padding()
                }

                
                
            }
        }
    }
}
    #Preview {
        FavoritesView()
    }*/

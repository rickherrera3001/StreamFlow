//
//  HomeView.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.
//

import SwiftUI

struct TabViewCustom: View {
    @State private var selectedTab: Int = 0
    
    @StateObject var viewModel = HomeViewModel() // Manteniendo el cambio aquí
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FirstView(viewModel: viewModel) // Usando el objeto de favoritos existente
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "star.circle")
                }
                .tag(1)
            
            GenderView()
                .tabItem {
                    Label("Gender", systemImage: "play.circle.fill")
                }
                .tag(2)
        }
    }
}
// vistas de titulos de peliculas

struct FirstView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        ZStack {
            Color(red: 18/255, green: 31/255, blue: 61/255)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    Image(systemName: "play.house.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                    Text("Stream Flow")
                        .foregroundColor(.green)
                        .italic()
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                }
                .padding(.top, 10)
                .offset(CGSize(width: 0, height: 20))
                
                ScrollView(.vertical) {
                    VStack(spacing: 30) {
                        // Primera vista horizontal
                        if let upcomingMovies = viewModel.upcomingMovies {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 20) {
                                    ForEach(upcomingMovies) { movie in
                                        MovieView(movie: movie)
                                            .padding(.vertical)
                                    }
                                }
                                .padding()
                            }
                        } else if let error = viewModel.error {
                            Text("Error: \(error.localizedDescription)")
                        } else {
                            ProgressView()
                        }

                        // Segunda vista horizontal
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0..<10) { index in
                                    // Reemplaza con tu vista personalizada
                                    Text("Item \(index)")
                                        .frame(width: 100, height: 100)
                                        .background(Color.red)
                                        .cornerRadius(10)
                                }
                            }
                            .padding()
                        }

                        // Tercera vista horizontal
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0..<10) { index in
                                    // Reemplaza con tu vista personalizada
                                    Text("Feature \(index)")
                                        .frame(width: 100, height: 100)
                                        .background(Color.green)
                                        .cornerRadius(10)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .onAppear {
                viewModel.getUpcomingMovies()
            }
        }
    }
}

    
    struct MovieView: View {
        let movie: Movies
        
        var body: some View {
            VStack {
                AsyncImage(url: URL(string: movie.primaryImage?.url ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 5)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 5)
                    @unknown default:
                        EmptyView()
                    }
                }

            }
        }
    }


// Helper extension to chunk an array into smaller arrays
extension Array {
    func chunked(into size: Int) -> [[Element]] {
        var chunks: [[Element]] = []
        for i in stride(from: 0, to: count, by: size) {
            let chunk = Array(self[i..<Swift.min(i + size, count)])
            chunks.append(chunk)
        }
        return chunks
    }
}

#Preview {
    TabViewCustom()
}



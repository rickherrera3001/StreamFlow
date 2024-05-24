//
//  HomeView.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.
//

import SwiftUI

struct TabViewCustom: View {
    @State private var selectedTab: Int = 0
    @ObservedObject var favorites: Favorites
    @StateObject var viewModel = HomeViewModel() // Manteniendo el cambio aquí

    init() {
        // Inicialización del objeto de favoritos
        self.favorites = Favorites()
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            FirstView(viewModel: viewModel, favorites: favorites) // Usando el objeto de favoritos existente
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

struct FirstView: View {
    @ObservedObject var viewModel: HomeViewModel // Manteniendo el cambio aquí
    @ObservedObject var favorites: Favorites

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
                    if let upcomingMovies = viewModel.upcomingMovies {
                        VStack(spacing: 30) {
                            ForEach(Array(upcomingMovies.chunked(into: 2)), id: \.self) { moviePair in
                                HStack(spacing: 20) {
                                    ForEach(moviePair) { movie in
                                        MovieView(movie: movie)
                                    }
                                }
                            }
                        }
                        .padding()
                    } else if let error = viewModel.error {
                        Text("Error: \(error.localizedDescription)")
                    } else {
                        ProgressView()
                    }
                }
            }
        }
        .onAppear {
            viewModel.getUpcomingMovies() // Manteniendo el cambio aquí
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
            Text(movie.titleText.text1 ?? "Unknown Title")
                .foregroundColor(.white)
                .frame(width: 150)
                .multilineTextAlignment(.center)
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



/*import SwiftUI

struct TabViewCustom: View {
    @State private var selectedTab: Int = 0
    @ObservedObject var favorites: Favorites
    @StateObject var viewModel = HomeViewModel() // Cambio aquí
    
    init() {
        // Inicialización del objeto de favoritos
        self.favorites = Favorites()
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FirstView(viewModel: viewModel, favorites: Favorites()) // Cambio aquí
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

struct FirstView: View {
    
    @ObservedObject var viewModel: HomeViewModel // Cambio aquí
    @ObservedObject var favorites: Favorites
    
    var body: some View {
        ZStack {
            Color(red: 18/255, green: 31/255, blue: 61/255)
                .ignoresSafeArea()
            
            VStack {
//                HStack {
//                    Text("Stream Flow")
//                        .padding(.top, 10)
//                        .offset(CGSize(width: 0, height: 20))
//                }
                HStack {
                    Image(systemName: "play.house.fill") // Reemplaza esto con el nombre de la imagen que deseas usar
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
                    if let upcomingMovies = viewModel.upcomingMovies {
                        VStack(spacing: 30) {
                            ForEach(upcomingMovies) { movie in
                                HorizontalScrollView(title: movie.titleText.text1 ?? "Unknown Title", color: .purple)
                            }
                        }
                        .padding()
                    } else if let error = viewModel.error {
                        Text("Error: \(error.localizedDescription)")
                    } else {
                        ProgressView()
                    }
                }
            }
        }
        .onAppear {
            viewModel.getUpcomingMovies() // Cambio aquí
        }
    }
}

struct HorizontalScrollView: View {
    let title: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(0..<10) { index in
                        VStack {
                            Text("Item \(index)")
                                .frame(width: 150, height: 150)
                                .background(color)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    TabViewCustom()
}*/





//<<<<<<<<<primero>>>>>>>>>

//import SwiftUI
//
//struct tabView: View {
//    @State private var selectedTab: Int = 0
//
//    var body: some View {
//        TabView(selection: $selectedTab) {
//            FirstView()
//                .tabItem {
//                    Label("Home", systemImage: "house.fill")
//                }
//                .tag(0)
//
//            FavoritesView()
//                .tabItem {
//                    Label("Favorites", systemImage: "star.circle")
//                }
//                .tag(1)
//
//            GenderView()
//                .tabItem {
//                    Label("Gender", systemImage: "play.circle.fill")
//                }
//                .tag(2)
//        }
//    }
//}
//
//struct FirstView: View {
//    var body: some View {
//        ZStack{
//            Color(red: 18/255, green: 31/255, blue: 61/255).ignoresSafeArea()
//
//            .edgesIgnoringSafeArea(.all) // Cubre toda la pantalla incluyendo las áreas seguras
//
//            VStack{
//                HStack {
//                    Text ("Home")
//                        .padding(.top,10)
//                        .offset(CGSize(width: 20, height: 20))
//
//                }
//
//                ScrollView(.vertical) {
//                    VStack(spacing: 30) {
//                        HorizontalScrollView(title: "Upcoming", color: .purple)
//                        HorizontalScrollView(title: "Comedy", color: .black)
//                        HorizontalScrollView(title: "Action", color: .blue)
//                        HorizontalScrollView(title: "ScrollView 4", color: .indigo)
//                    }
//                    .padding()
//                }
//            }
//        }
//        .onAppear()
//    }
//}
//
//
//struct HorizontalScrollView: View {
//    let title: String
//    let color: Color
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text(title)
//                .font(.headline)
//                .padding(.leading)
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 20) {
//                    ForEach(0..<51) { index in
//                        Text("Item \(index)")
//                            .frame(width: 150, height: 150)
//                            .background(color)
//                            .cornerRadius(10)
//                            .shadow(radius: 5)
//                    }
//                }
//                .padding()
//            }
//        }
//    }
//}
//
//
//#Preview {
//    tabView()
//}




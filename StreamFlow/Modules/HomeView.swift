//
//  HomeView.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.
//

import SwiftUI

struct tabView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
        
        VStack {
            
        }
        TabView(selection: $selectedTab) {
            FirstView()
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
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 30) {
                HorizontalScrollView(title: "Upcoming", color: .red)
                HorizontalScrollView(title: "Comedy", color: .green)
                HorizontalScrollView(title: "Action", color: .blue)
                HorizontalScrollView(title: "ScrollView 4", color: .indigo)
            }
            .padding()
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
                    ForEach(0..<51) { index in
                        Text("Item \(index)")
                            .frame(width: 150, height: 150)
                            .background(color)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding()
            }
        }
    }
}


#Preview {
    tabView()
}


//            Image(systemName: "play.house")
//                .foregroundColor(.blue)
//            Text("Home")
//                .italic()
//            //                        .font(.custom("YourFontName", size: 24))
//                .foregroundColor(.blue) //color del texto
//                .font(.system(size: 26))//tamaño del texto
//                .fontWeight(.bold) // texto negrita

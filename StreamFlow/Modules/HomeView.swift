//
//  HomeView.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.
//

import SwiftUI

import SwiftUI

struct tabView: View {
    @State private var selectedTab: Int = 0
    
    var body: some View {
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
        VStack {
            NavigationLink(destination: FirstDetailView()) {
                
            }
        }
        .padding()
    }
}

struct SecondView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: SecondDetailView()) {
                
            }
        }
        .padding()
    }
}

struct ThirdView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: ThirdDetailView()) {
               
            }
        }
        .padding()
    }
}

// Example detail views
struct FirstDetailView: View {
    var body: some View {
        Text("First Detail View")
    }
}

struct SecondDetailView: View {
    var body: some View {
        Text("Second Detail View")
    }
}

struct ThirdDetailView: View {
    var body: some View {
        Text("Third Detail View")
    }
}



//struct HomeView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

#Preview {
    tabView()
}

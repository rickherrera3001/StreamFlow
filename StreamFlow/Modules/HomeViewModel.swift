//
//  HomeViewModel.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.
//

import Foundation
import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    
    
    @Published var upcomingMovies: [Movies]? = []
    @Published var error: Error?
    
    
    private let apiClient = APIClient()
    
    func getUpcomingMovies() {
        apiClient.getDataUpcoming() { result in
            DispatchQueue.main.async {
                switch result {
                case.success(let upcomings):
                    self.upcomingMovies = upcomings.results
                    print("Results \(upcomings)")
                case.failure(let error):
                    print("Error \(error)")
                }
            }
            
        }
        
    }
}
/*
 import Foundation
 import SwiftUI
 import Combine

 class MoviesViewModel: ObservableObject {
     
     @Published var movies: [MovieModel] = []
     @Published var isLoading: Bool = false
     @Published var error: Error?

     
     func fetchUpcomingMovies() {
         isLoading = true
         APIClient().getDataUpcoming { [weak self] result in
             DispatchQueue.main.async {
                 self?.isLoading = false
                 switch result {
                 case .success(let movies):
                     self?.movies = [movies]
                 case .failure(let error):
                     self?.error = error
                 }
             }
         }
     }
 }
 */




// 3 publiser
// 2 funciones 

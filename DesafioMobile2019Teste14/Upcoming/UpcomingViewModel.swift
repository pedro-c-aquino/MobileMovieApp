//
//  UpcomingViewModel.swift
//  DesafioMobile2019Teste14
//
//  Created by Vinicius Angelo on 27/09/22.
//

import Foundation

protocol MovieDataProtocol {
    func getMovieData(_ movies: [Result])
}

class UpcomingViewModel {
    
    private let networkManager = NetworkManager()
    
    var delegate: MovieDataProtocol?
    
    func getUpcomingMovies() {
        networkManager.getMovies(movieType: "upcoming") { (upcomingMovies: UpcomingModel) in
            guard let movies = upcomingMovies.results else {
                print("Unable to unwrap movies")
                return
            }
            self.delegate?.getMovieData(movies)
        }
    }
}

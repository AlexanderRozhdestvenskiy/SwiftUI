//
//  MoviesViewModel.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 12.12.2021.
//

import Foundation
import Combine

final class MoviesViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var searched: String = ""
    @Published var addMovieScreenPresented = false
    
    private var getMovie: GetMovieList {
        DefaultGetMovie(moviesRepo: MoviesRepoLocal())
    }
    
    private var deleteMovie: DeleteMovieList {
        DefaultDeleteMovie(moviesRepo: MoviesRepoLocal())
    }
    
    private var addMovie: AddMovieList {
        DefaultAddMovie(moviesRepo: MoviesRepoLocal())
    }
    
    private var cancelable: AnyCancellable?
    
    init() {
        cancelable = $searched.sink { [weak self] str in
            self?.loadData(filter: str)
        }
    }
    
    func addMovie(name: String, date: Date) {
        addMovie.execute(requestValue: AddMovie(movie: Movie(name: name, date: date, imageName: nil))) { [weak self] in
            guard let self = self else { return }
            self.loadData(filter: self.searched)
        }
    }
    
    func removeMovies(indexes: IndexSet) {
        indexes.forEach {
            deleteMovie.execute(requestValue: DeleteMovie(movie: movies.remove(at: $0))) {}
        }
    }
    
    private func loadData(filter: String = "") {
        getMovie.execute(requestValue: GetMovie(filter: filter)) { [weak self] movies in
            self?.movies = movies
        }
    }
}

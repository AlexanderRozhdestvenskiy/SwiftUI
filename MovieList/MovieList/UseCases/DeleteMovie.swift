//
//  DeleteMovie.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 12.12.2021.
//

import Foundation

struct DeleteMovie {
    let movie: Movie
}

protocol DeleteMovieList {
    func execute(requestValue: DeleteMovie, completion: @escaping () -> Void)
}

final class DefaultDeleteMovie: DeleteMovieList {
    let moviesRepo: MoviesRepo
    
    init(moviesRepo: MoviesRepo) {
        self.moviesRepo = moviesRepo
    }
    
    func execute(requestValue: DeleteMovie, completion: @escaping () -> Void) {
        moviesRepo.deleteMovie(movie: requestValue.movie)
        completion()
    }
}

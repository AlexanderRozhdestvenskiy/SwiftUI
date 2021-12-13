//
//  AddMovie.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 12.12.2021.
//

import Foundation

struct AddMovie {
    let movie: Movie
}

protocol AddMovieList {
    func execute(requestValue: AddMovie, completion: @escaping () -> Void)
}

final class DefaultAddMovie: AddMovieList {
    let moviesRepo: MoviesRepo
    
    init(moviesRepo: MoviesRepo) {
        self.moviesRepo = moviesRepo
    }
    
    func execute(requestValue: AddMovie, completion: @escaping () -> Void) {
        let movie = Movie(name: requestValue.movie.name,
                          date: requestValue.movie.date,
                          imageName: requestValue.movie.imageName ?? "noImage")
        moviesRepo.createMovie(movie: movie)
        completion()
    }
}

//
//  GetMovie.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 12.12.2021.
//

import Foundation

struct GetMovie {
    let filter: String
}

protocol GetMovieList {
    func execute(requestValue: GetMovie, completion: @escaping ([Movie]) -> Void)
}

final class DefaultGetMovie: GetMovieList {
    let moviesRepo: MoviesRepo
    
    init(moviesRepo: MoviesRepo) {
        self.moviesRepo = moviesRepo
    }
    
    func execute(requestValue: GetMovie, completion: @escaping ([Movie]) -> Void) {
        completion(moviesRepo.getMoviesList(filter: requestValue.filter))
    }
}

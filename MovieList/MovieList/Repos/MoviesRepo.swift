//
//  MoviesRepo.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 12.12.2021.
//

import Foundation

protocol MoviesRepo {
    func getMoviesList(filter: String) -> [Movie]
    func createMovie(movie: Movie)
    func deleteMovie(movie: Movie)
}

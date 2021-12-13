//
//  MoviesRepoLocal.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 12.12.2021.
//

import Foundation

final class MoviesRepoLocal: MoviesRepo {
    private static var movieList: [Movie] = [
        Movie(name: "Forrest Gump", date: Date.from(string: "01-10-1993"), imageName: "4k.tv"),
        Movie(name: "Kill Bill", date: Date.from(string: "01-10-2000"), imageName: "4k.tv"),
        Movie(name: "Figth Club", date: Date.from(string: "01-10-1995"), imageName: "4k.tv"),
        Movie(name: "Killer", date: Date.from(string: "02-06-1987"), imageName: "4k.tv"),
        Movie(name: "Avatar", date: Date.from(string: "02-12-2009"), imageName: "4k.tv"),
        Movie(name: "Interstellar", date: Date.from(string: "13-10-2014"), imageName: "4k.tv"),
        Movie(name: "Fury", date: Date.from(string: "15-03-2014"), imageName: "4k.tv")
    ]
    
    func getMoviesList(filter: String) -> [Movie] {
        return Self.movieList.filter { $0.name.contains(filter) || filter.isEmpty}
    }
    
    func createMovie(movie: Movie) {
        deleteMovie(movie: movie)
        
        Self.movieList.append(movie)
    }
    
    func deleteMovie(movie: Movie) {
        Self.movieList.removeAll() { $0.name == movie.name && $0.date == $0.date }
    }
}

private extension Date {
    static func from(string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        return dateFormatter.date(from: string) ?? Date()
    }
}

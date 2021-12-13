//
//  MoviesListView.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 13.12.2021.
//

import SwiftUI

struct MoviesListView: View {
    
    @ObservedObject var viewModel: MoviesViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.movies, id: \.id) {
                MovieRow(movie: $0)
            }
            .onDelete {
                viewModel.removeMovies(indexes: $0)
            }
        }
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView(viewModel: MoviesViewModel())
    }
}

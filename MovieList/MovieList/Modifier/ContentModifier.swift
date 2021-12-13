//
//  ContentModifier.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 12.12.2021.
//

import SwiftUI

struct ContentModifier: ViewModifier {
    
    @ObservedObject var viewModel: MoviesViewModel
    
    func body(content: Content) -> some View {
        content
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.addMovieScreenPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
            }
            .fullScreenCover(isPresented: $viewModel.addMovieScreenPresented) {
                CreateMovieView(viewModel: viewModel)
            }
    }
}


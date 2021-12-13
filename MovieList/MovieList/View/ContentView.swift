//
//  ContentView.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 12.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MoviesViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                MoviesSearchView(viewModel: viewModel)
                MoviesListView(viewModel: viewModel)
            }
            .modifier(ContentModifier(viewModel: viewModel))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

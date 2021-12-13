//
//  MoviesSearchView.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 12.12.2021.
//

import SwiftUI

struct MoviesSearchView: View {
    
    @ObservedObject var viewModel: MoviesViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.secondary.opacity(0.2))
                .cornerRadius(10)
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $viewModel.searched)
                    .keyboardType(.webSearch)
                    .foregroundColor(.black)
                Group {
                    if viewModel.searched != "" {
                        Button {
                            viewModel.searched = ""
                        } label: {
                            withAnimation {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .padding(.trailing, 8)
            .padding(.leading, 12)
        }
        .frame(height: 38)
        .padding(.trailing, 16)
        .padding(.leading, 16)
    }
}

struct MoviesSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesSearchView(viewModel: MoviesViewModel())
    }
}

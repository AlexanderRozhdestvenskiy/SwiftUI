//
//  MovieRow.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 13.12.2021.
//

import SwiftUI

struct MovieRow: View {
    
    var movie: Movie
    
    var body: some View {
        HStack {
            Image(systemName: movie.imageName ?? "")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .cornerRadius(5)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(.gray.opacity(0.2))
            VStack(alignment: .leading) {
                HStack {
                    Text("Name:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(movie.name)
                        .font(.system(size: 15, weight: .bold))
                }
                Spacer()
                    .frame(height: 10)
                HStack {
                    Text("Date:")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(movie.date, style: .date)
                        .font(.system(size: 13))
                }
            }
        }
        .padding(5)
    }
}

struct MovieRow_Previews: PreviewProvider {
    static var previews: some View {
        MovieRow(movie: Movie(name: "hhhh", date: Date(), imageName: "hfgfh"))
    }
}

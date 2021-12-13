//
//  Model.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 12.12.2021.
//

import Foundation

struct Movie: Identifiable, Equatable {
    let id: String = UUID().uuidString
    let name: String
    let date: Date
    let imageName: String?
}

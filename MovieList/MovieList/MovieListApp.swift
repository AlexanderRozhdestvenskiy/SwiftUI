//
//  MovieListApp.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 12.12.2021.
//

import SwiftUI

@main
struct MovieListApp: App {
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { phase in
            if phase == .background {
                // TODO:
            }
        }
    }
}

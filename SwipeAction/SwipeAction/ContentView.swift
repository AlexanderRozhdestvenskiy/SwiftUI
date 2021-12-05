//
//  ContentView.swift
//  SwipeAction
//
//  Created by Alexander Rozhdestvenskiy on 03.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<250) { i in
                VStack(alignment: .leading) {
                    Text("\(i)")
                    Text("Swipe")
                }
                .swipeActions {
                    Button(role: .destructive) {
                        print("Delete")
                    } label: {
                        Label("Delete", systemImage: "trash.circle.fill")
                    }
                    .tint(.red)
                    
                    Button {
                        print("Favorite")
                    } label: {
                        Label("Favorite", systemImage: "star.circle.fill")
                    }
                    .tint(.green)
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button {
                        print("Pin")
                    } label: {
                        Label("Pin", systemImage: "pin.circle.fill")
                    }
                    .tint(.orange)
                }
                
            }
            .listStyle(.grouped)
            .navigationTitle("List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

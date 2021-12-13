//
//  CreateMovieView.swift
//  MovieList
//
//  Created by Alexander Rozhdestvenskiy on 13.12.2021.
//

import SwiftUI

struct CreateMovieView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: MoviesViewModel
    
    @State private var name = ""
    @State private var date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Movie")) {
                    TextField("Name", text: $name)
                }
                DisclosureGroup("Date") {
                    DatePicker("", selection: $date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
            }
            .navigationTitle("Add")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.addMovie(name: name, date: date)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Save")
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}

struct CreateMovieView_Previews: PreviewProvider {
    static var previews: some View {
        CreateMovieView(viewModel: MoviesViewModel())
    }
}

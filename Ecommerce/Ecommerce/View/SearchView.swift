//
//  SearchView.swift
//  Ecommerce
//
//  Created by Alexander Rozhdestvenskiy on 06.12.2021.
//

import SwiftUI

struct SearchView: View {
    
    var animation: Namespace.ID
    
    @EnvironmentObject var homeData: HomeVM
    
    @FocusState var startTF: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 20) {
                Button {
                    withAnimation {
                        homeData.searchActivated = false
                    }
                } label: {
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.black.opacity(0.7))
                }
                
                HStack(spacing: 15) {
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $homeData.searchText)
                        .focused($startTF)
                        .textCase(.lowercase)
                        .disableAutocorrection(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .strokeBorder(.indigo, lineWidth: 1)
                )
                .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                .padding(.trailing, 20)
            }
            .padding([.horizontal, ])
            .padding(.top)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(
            Color("Home")
                .ignoresSafeArea()
        )
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                startTF = true
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

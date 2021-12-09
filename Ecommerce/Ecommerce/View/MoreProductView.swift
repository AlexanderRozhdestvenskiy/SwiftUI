//
//  MoreProductView.swift
//  Ecommerce
//
//  Created by Alexander Rozhdestvenskiy on 05.12.2021.
//

import SwiftUI

struct MoreProductView: View {
    var body: some View {
        VStack {
            Text("More Products")
                .font(.title)
                .bold()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color("Home"))
        .ignoresSafeArea()
    }
}

struct MoreProductView_Previews: PreviewProvider {
    static var previews: some View {
        MoreProductView()
    }
}

//
//  BackgroundWelcomeBack.swift
//  Ecommerce
//
//  Created by Alexander Rozhdestvenskiy on 01.12.2021.
//

import SwiftUI

struct BackgroundWelcomeBack: View {
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [.orange, .purple.opacity(0.5)],
                           startPoint: .top,
                           endPoint: .bottom)
                .frame(width: 100,
                       height: 100)
                .clipShape(Circle())
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .topTrailing)
                .padding(.trailing)
                .offset(y: -25)
                .ignoresSafeArea()
            
            Circle()
                .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                .frame(width: 30, height: 30)
                .blur(radius: 3)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .bottomTrailing)
                .padding(30)
            
            Circle()
                .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                .frame(width: 30, height: 30)
                .blur(radius: 3)
                .frame(maxWidth: .infinity,
                       maxHeight: .infinity,
                       alignment: .topLeading)
                .padding(.leading, 30)
        }
    }
}


struct BackgroundWelcomeBack_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundWelcomeBack()
    }
}

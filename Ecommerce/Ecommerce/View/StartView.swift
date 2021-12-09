//
//  StartView.swift
//  Ecommerce
//
//  Created by Alexander Rozhdestvenskiy on 01.12.2021.
//

import SwiftUI

struct StartView: View {
    
    @State private var showWelcomeView = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Find your\nGadget")
                .foregroundColor(.white)
                .font(Font.system(size: 50,
                                  weight: Font.Weight.heavy,
                                  design: Font.Design.rounded
                                 )
                )
            
            Image(systemName: "printer.dotmatrix.fill")
                .resizable()
                .foregroundColor(.yellow)
                .scaledToFit()
            
            Button {
                withAnimation {
                    showWelcomeView = true
                }
            } label: {
                Text("Get Started")
                    .font(Font.system(size: 20))
                    .fontWeight(.semibold)
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.25), radius: 4, x: 4, y: 4)
                
            }
            .padding(.horizontal, 24)
            .offset(y: getRect().height < 750 ? 10 : 40)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.indigo)
        .overlay(
            Group {
                if showWelcomeView {
                    WelcomeView()
                        .transition(.move(edge: .bottom))
                }
            }
        )
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
        
    }
}

// MARK: - Only big Display

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

//
//  ContentView.swift
//  Ecommerce
//
//  Created by Alexander Rozhdestvenskiy on 01.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("logStatus") var logStatus: Bool = false
    
    var body: some View {
        Group {
            if logStatus {
                MainView()
            } else {
                WelcomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

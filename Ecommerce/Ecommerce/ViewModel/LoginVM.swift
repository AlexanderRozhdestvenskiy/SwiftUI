//
//  LoginVM.swift
//  Ecommerce
//
//  Created by Alexander Rozhdestvenskiy on 01.12.2021.
//

import Foundation
import SwiftUI

final class LoginVM: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    @Published var registerUser: Bool = false
    @Published var reEnterPassword: String = ""
    @Published var showReEnterPassword: Bool = false
    
    @AppStorage("logStatus") var logStatus: Bool = false
    
    func login() {
        withAnimation {
            logStatus = true
        }
    }
    
    func register() {
        withAnimation {
            logStatus = true
        }
    }
    
    func forgotPassword() {
        
    }
}

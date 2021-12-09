//
//  WelcomeView.swift
//  Ecommerce
//
//  Created by Alexander Rozhdestvenskiy on 01.12.2021.
//

import SwiftUI

struct WelcomeView: View {
    
    @StateObject var loginData = LoginVM()
    
    var body: some View {
        
        VStack {
            
            Text("Welcome\nback")
                .font(Font.system(size: 50,
                                  weight: Font.Weight.heavy,
                                  design: Font.Design.rounded
                                 )
                )
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: getRect().height / 4)
                .padding()
                .background(BackgroundWelcomeBack())
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    Text(loginData.registerUser ? "Register" : "Login")
                        .font(Font.system(size: 20))
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    customTextField(icon: "envelope", title: "Email", hint: "justine@gmail.com", value: $loginData.email, showPassword: .constant(false))
                        .padding(.top, 30)
                    
                    customTextField(icon: "lock", title: "Password", hint: "12345", value: $loginData.password, showPassword: $loginData.showPassword)
                        .padding(.top, 10)
                    
                    if loginData.registerUser {
                        customTextField(icon: "envelope", title: "Re-Enter Password", hint: "12345", value: $loginData.reEnterPassword, showPassword: $loginData.showReEnterPassword)
                            .padding(.top, 10)
                    }
                    
                    Button {
                        loginData.forgotPassword()
                    } label: {
                        Text("Forgot Password?")
                            .font(Font.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.indigo)
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        if loginData.registerUser {
                            loginData.register()
                        } else {
                            loginData.login()
                        }
                    } label: {
                        Text("Login")
                            .font(Font.system(size: 17))
                            .fontWeight(.bold)
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color.indigo)
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    }
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    Button {
                        withAnimation {
                            loginData.registerUser.toggle()
                        }
                    } label: {
                        Text(loginData.registerUser ? "Back to login" : "Create account")
                            .font(Font.system(size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(.indigo)
                    }
                    .padding(.top, 8)
                }
                .padding(22)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Color.white
                    .clipShape(CustomCorners(corners: [.topLeft, .topRight],
                                             radius: 24))
                    .ignoresSafeArea()
            )
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.indigo)
        
        .onChange(of: loginData.registerUser) { newValue in
            loginData.email = ""
            loginData.password = ""
            loginData.reEnterPassword = ""
            loginData.showPassword = false
            loginData.showReEnterPassword = false
        }
    }
    
    @ViewBuilder
    func customTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>) -> some View {
        
        VStack(alignment: .leading, spacing: 12) {
            Label {
                Text(title)
                    .font(Font.system(size: 14))
            } icon: {
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top, 2)
            } else {
                TextField(hint, text: value)
                    .padding(.top, 2)
            }
            
            
            Divider()
                .background(Color.black.opacity(0.4))
        }
        .overlay(
            Group {
                if title.contains("Password") {
                    Button {
                        showPassword.wrappedValue.toggle()
                    } label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .font(Font.system(size: 13))
                            .fontWeight(.semibold)
                            .foregroundColor(.indigo)
                    }
                    .offset(y: 8)
                    
                }
            }
            , alignment: .trailing
        )
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

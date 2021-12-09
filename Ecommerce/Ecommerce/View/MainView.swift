//
//  MainView.swift
//  Ecommerce
//
//  Created by Alexander Rozhdestvenskiy on 02.12.2021.
//

import SwiftUI

struct MainView: View {
    
    @State private var currentTab: Tab = .Home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            TabView(selection: $currentTab) {
                
                HomeView()
                    .tag(Tab.Home)
                
                Text("Liked")
                    .tag(Tab.Liked)
                
                Text("Profile")
                    .tag(Tab.Profile)
                
                Text("Cart")
                    .tag(Tab.Cart)
            }
            
            // TabBar - Custom
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.self) { tab in
                    Button {
                        currentTab = tab
                    } label: {
                        Image(systemName: tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .background(
                                Color.indigo
                                    .opacity(0.2)
                                    .cornerRadius(4)
                                    .blur(radius: 5)
                                    .padding(-7)
                                    .opacity(currentTab == tab ? 1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? .indigo : .black.opacity(0.25))
                    }
                }
            }
            .padding([.horizontal, .top])
            .padding(.bottom, 10)
        }
        .background(Color("Home"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

enum Tab: String, CaseIterable {
    case Home = "house.fill"
    case Liked = "heart.fill"
    case Profile = "person.fill"
    case Cart = "cart.fill"
}

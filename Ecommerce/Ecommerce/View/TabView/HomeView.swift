//
//  HomeView.swift
//  Ecommerce
//
//  Created by Alexander Rozhdestvenskiy on 02.12.2021.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var homeData = HomeVM()
    
    @Namespace var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                ZStack {
                    if homeData.searchActivated {
                        searchBar()
                    } else {
                        searchBar()
                            .matchedGeometryEffect(id: "SEARCHBAR", in: animation)
                    }
                }
                .frame(width: getRect().width / 1.6)
                .padding(.horizontal, 25)
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        homeData.searchActivated = true
                    }
                }
                
                Text("Order online\ncollect in store")
                    .font(Font.system(size: 30,
                                      weight: Font.Weight.heavy,
                                      design: Font.Design.rounded
                                     )
                    )
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                    .padding(.horizontal, 24)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 18) {
                        ForEach(ProductType.allCases, id: \.self) { type in
                            productTypeView(type: type)
                        }
                    }
                    .padding(.horizontal, 24)
                }
                .padding(.top, 28)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 24) {
                        ForEach(homeData.filteredProduct) { product in
                            productCardView(product: product)
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom)
                    .padding(.top, 80)
                }
                .padding(.top, 24)
                
                Button {
                    homeData.showMoreProductsOnType.toggle()
                } label: {
                    Label {
                        Image(systemName: "arrow.right")
                    } icon: {
                        Text("see more")
                    }
                    .font(.headline)
                    .foregroundColor(.indigo)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
                .padding(.top, 12)
            }
            .padding(.vertical)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Home"))
        .onChange(of: homeData.productType) { newValue in
            homeData.filterProductByType()
        }
        .sheet(isPresented: $homeData.showMoreProductsOnType) {
            
        } content: {
            MoreProductView()
        }
        .overlay(
            ZStack {
                if homeData.searchActivated {
                    SearchView(animation: animation)
                        .environmentObject(homeData)
                }
            }
        )
    }
    
    @ViewBuilder
    func searchBar() -> some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .font(.title2)
                .foregroundColor(.gray)
            
            TextField("Search", text: .constant(""))
                .disabled(true)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(
            Capsule()
                .strokeBorder(.gray, lineWidth: 1)
        )
    }
    
    @ViewBuilder
    func productCardView(product: Product) -> some View {
        VStack(spacing: 8) {
            Image(systemName: product.productImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: getRect().width / 2.5,
                       height: getRect().width / 2.5
                )
                .offset(y: -80)
                .padding(.bottom, -80)
            
            Text(product.title)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text(product.subtitle)
                .font(.title3)
                .foregroundColor(.gray)
            
            Text(product.price)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.indigo)
                .padding(.top, 5)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 22)
        .background(Color.white.cornerRadius(24))
    }
    
    @ViewBuilder
    func productTypeView(type: ProductType) -> some View {
        Button {
            withAnimation {
                homeData.productType = type
            }
        } label: {
            Text(type.rawValue)
                .font(Font.system(size: 16))
                .fontWeight(.semibold)
                .foregroundColor(homeData.productType == type ? Color.indigo : Color.gray)
                .padding(.bottom, 10)
                .overlay(
                    ZStack {
                        if homeData.productType == type {
                            Capsule()
                                .fill(.indigo)
                                .matchedGeometryEffect(id: "PRODUCTTAB", in: animation)
                                .frame(height: 2)
                        } else {
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 2)
                        }
                    }.padding(.horizontal, -4)
                    , alignment: .bottom
                )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

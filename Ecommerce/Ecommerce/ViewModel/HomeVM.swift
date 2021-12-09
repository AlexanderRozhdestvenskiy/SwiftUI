//
//  HomeVM.swift
//  Ecommerce
//
//  Created by Alexander Rozhdestvenskiy on 02.12.2021.
//

import SwiftUI

final class HomeVM: ObservableObject {
    
    @Published var productType: ProductType = .Wearable
    
    @Published var products: [Product] = Product.data
    
    @Published var filteredProduct: [Product] = []
    
    @Published var showMoreProductsOnType: Bool = false
    
    @Published var searchText: String = ""
    @Published var searchActivated: Bool = false
    
    init() {
        filterProductByType()
    }
    
    func filterProductByType() {
        DispatchQueue.global(qos: .userInteractive).async {
            let result = self.products
                .lazy
                .filter { product in
                    return product.type == self.productType
                }
                .prefix(4)
            
            DispatchQueue.main.async {
                self.filteredProduct = result.compactMap({ product in
                    return product
                })
            }
        }
    }
}

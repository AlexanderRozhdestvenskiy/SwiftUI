//
//  Product.swift
//  Ecommerce
//
//  Created by Alexander Rozhdestvenskiy on 02.12.2021.
//

import Foundation

struct Product: Identifiable, Hashable {
    var id = UUID().uuidString
    var type: ProductType
    var title: String
    var subtitle: String
    var description: String = ""
    var price: String
    var productImage: String = ""
    var quantity: Int = 1
}

enum ProductType: String, CaseIterable {
    case Wearable = "Wearable"
    case Laptops = "Laptops"
    case Phones = "Phones"
    case Tablets = "Tablets"
}

extension Product {
    static var data: [Product] {
        [
            Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 6", price: "$359", productImage: "applewatch"),
            Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 5", price: "$459", productImage: "applewatch.watchface"),
            Product(type: .Wearable, title: "Apple Watch", subtitle: "Series 7", price: "$259", productImage: "exclamationmark.applewatch"),
            
            Product(type: .Tablets, title: "iPad 6", subtitle: "Silver", price: "$459", productImage: "ipad"),
            Product(type: .Tablets, title: "iPad 7", subtitle: "Black", price: "$559", productImage: "ipad.homebutton"),
            Product(type: .Tablets, title: "iPad Pro", subtitle: "White", price: "$659", productImage: "apps.ipad"),
            
            Product(type: .Phones, title: "iPhone 11", subtitle: "128 GB", price: "$759", productImage: "iphone"),
            Product(type: .Phones, title: "iPhone 12", subtitle: "256 GB", price: "$859", productImage: "iphone.homebutton"),
            Product(type: .Phones, title: "iPhone 13", subtitle: "512 GB", price: "$1059", productImage: "apps.iphone"),
            
            Product(type: .Laptops, title: "MacBook Air", subtitle: "M1 256", price: "$999", productImage: "macpro.gen3"),
            Product(type: .Laptops, title: "MacBook Pro", subtitle: "M1 512", price: "$1999", productImage: "macpro.gen3.fill"),
            Product(type: .Laptops, title: "iMac 24", subtitle: "M1 512", price: "$1499", productImage: "desktopcomputer"),
            
        ]
    }
}

//
//  TabBarView.swift
//  Forelesing_3_23
//
//  Created by Benjamin Nærø on 18/09/2023.
//

import SwiftUI

struct TabBarView: View {
    
    @State var shoppingCart = [Product]()
    
    var body: some View {
        TabView {
            ProductListView(products: Product.demoProducts, isAdmin: false, shoppingCart: $shoppingCart)
                .tabItem {
                    Label("Produkter", systemImage: "tshirt")
                }
            
            ShoppingCartView()
                .badge($shoppingCart.count)
                .tabItem {
                    Label("Handlekurv", systemImage: "cart")
                }
            SettingsView()
                .tabItem {
                    Label("Innstillinger", systemImage: "gear")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}

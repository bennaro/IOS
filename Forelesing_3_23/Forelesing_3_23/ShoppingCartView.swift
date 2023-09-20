//
//  ShoppingCart.swift
//  Forelesing_3_23
//
//  Created by Benjamin Nærø on 18/09/2023.
//

import SwiftUI

struct ShoppingCartView: View {
    var body: some View {
        NavigationView {
        Text("Shopping Cart!")
                .navigationTitle("Handlekurv")
        }
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartView()
    }
}

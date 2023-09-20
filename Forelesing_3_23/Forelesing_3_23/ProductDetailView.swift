//
//  ProductDetailView.swift
//  Forelesing_3_23
//
//  Created by Benjamin Nærø on 04/09/2023.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    var body: some View {
        VStack {
            HStack {
                
                Text(product.name)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Spacer()
                
            }
            Image("vansProduct")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:350)
            
            Text(product.description)
                .padding()
            
            Spacer()
            
            HStack{
            Text("\(product.price + Int.random(in: 10...400)) kr ")
                .strikethrough()
            
            Text("\(product.price) kr")
                
            }
            .padding()
            
            Button {
                // TODO: buy product
            } label: {
                Label("Buy Now", systemImage: "cart.badge.plus")
                    .padding(.horizontal)
            }
            .buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.red)
            
            Spacer()
            
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: .init(name: "VANS Skate Old Skool", description: "VANS Skate Old Skool black/white. Increased durability with DURACAP. Legendary grip with SickStick. Our best PopCush Cushioning.", price: 899))
    }
}

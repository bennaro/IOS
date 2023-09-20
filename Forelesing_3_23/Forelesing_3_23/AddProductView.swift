//
//  AddProductView.swift
//  Forelesing_3_23
//
//  Created by Benjamin Nærø on 11/09/2023.
//

import SwiftUI

struct AddProductView: View {
    
    @State var newProductName: String = ""
    @State var newProductDescription: String = ""
    @State var newProductPrice: String = ""
    
    @State var isShowingErrorAlert: Bool = false
    
    var didAddProduct: ((Product) -> ())
    
    init(didAddProduct: @escaping ((Product) -> Void)) {
        self.didAddProduct = didAddProduct
    }
    
    func addProduct() {
        
        if let productPrice = Int(newProductPrice) {
            let product = Product (
                name:        newProductName,
                description: newProductDescription,
                price:       productPrice
            )
            didAddProduct(product)
        } else {
            isShowingErrorAlert = true
        }
        return()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                TextField("Produktnavn", text: $newProductName)
                TextField("Beskrivelse", text: $newProductDescription)
                TextField("Pris", text: $newProductPrice)
                
                
                Button {
                    // user tapped button
                    print("user tapped button")
                    addProduct()
                } label: {
                    Text("Lagre Produkt")
                }
                .controlSize(.large)
                
            }
            .navigationTitle(Text("Legg til nytt produkt"))
        }
        .alert("Det skjedde noe feil", isPresented: $isShowingErrorAlert) {
            Text("Dette var actions")
        } message: {
            Text("Dette var message")
        }

    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView() { product in
            
        }
    }
}

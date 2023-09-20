//
//  ContentView.swift
//  Forelesing_3_23
//
//  Created by Benjamin Nærø on 04/09/2023.
//

import SwiftUI

    
    enum UserLevel {
        case user
        case admin
        case employee
    }
    
struct ProductListView: View {
    
    init(products: [Product], isAdmin: Bool, shoppingCart: Binding<[Product]>) {
        self.products = products
        self.isAdmin = isAdmin
        self.shoppingCart = shoppingCart
    }
    
    var shoppingCart: Binding <[Product]>
    
    let isAdmin: Bool
    
    @State var products: [Product]
    
    @State var isPresentingAddProductView: Bool = false
    
    @State var isShowingAlert: Bool = false
    
    @State var newProductName: String = ""
    @State var newProductDescription: String = ""
    @State var newProductPrice: String = ""
    
    func addProduct() {
        print("user still tapped button")
        if let productPrice = Int(newProductPrice) {
            let product = Product(name: newProductName, description: newProductDescription, price: productPrice)
            products.append(product)
        } else {
            print("feil format _\(newProductPrice)_")
        }
    }
    
    
    
    var body: some View {
        NavigationStack {
            
            ScrollView {
                ForEach(products) { product in
                    HStack {
                        NavigationLink {
                            ProductDetailView(product: product)
                        } label: {
                            ListItemView(product: product)
                        }
                        Spacer()
                        if isAdmin == false {
                            UpdateProductView(
                                minusButtonTapped: {
                                    print("Minus button tapped")
                                    var hasRemoved = false
                                    shoppingCart.wrappedValue.removeAll { filteredProduct in
                                        if filteredProduct.id == product.id, hasRemoved == false {
                                            hasRemoved = true
                                            return true
                                        }
                                        return false
                                    }
                                    print(shoppingCart)
                                },
                                plusButtonTapped: {
                                    print("Plus button tapped")
                                    shoppingCart.wrappedValue.append(product)
                                    print(shoppingCart)
                                })
                            .padding()
                        }
                    }
                }
                if isAdmin {
                    Button ("Legg til produkt") {
                        //let newProduct = Product.init(name: "Sokker", description: "small, gule", price: 230)
                        //products.append(newProduct)
                        
                        isPresentingAddProductView = true
                    }
                } else {
                    Text("Du er en vanlig bruker")
                }
            }
            .sheet(isPresented: $isPresentingAddProductView) {
                AddProductView() { product in
                    print(product)
                    products.append(product)
                    isPresentingAddProductView = false
                }
            }
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(products: Product.demoProducts, isAdmin: false, shoppingCart: .constant([]))
    }
}

struct ListItemView: View {
    
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(product.name)")
            Text("\(product.description)")
                .foregroundColor(.gray)
        }
        .padding()
        .foregroundColor(.brown)
    }
}

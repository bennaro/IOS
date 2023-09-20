//
//  UpdateProductView.swift
//  Forelesing_3_23
//
//  Created by Benjamin Nærø on 12/09/2023.
//

import SwiftUI

struct UpdateProductView: View {
    
    var minusButtonTapped: (() -> ())
    
    var plusButtonTapped: (() -> Void)
    
    init(
        minusButtonTapped: @escaping (() -> Void),
        plusButtonTapped: @escaping (() -> Void)
    ) {
        self.minusButtonTapped = minusButtonTapped
        self.plusButtonTapped = plusButtonTapped
    }
    
    
    @State var demoText: String = ""
    
    var body: some View {
        HStack {            
            ZStack {
                Circle()
                Text("+")
                    .foregroundColor(.white)
            }
            .onTapGesture {
                print("Did tap the circle +")
                plusButtonTapped()
            }
            
            
            ZStack {
                Circle()
                Text("-")
                    .foregroundColor(.white)
            }
            .onTapGesture {
                print("Did tap the circle -")
                minusButtonTapped()
            }
            
            
        }
        .font(.title)
        .padding()
        .frame(width: 140)
    }
}

struct UpdateProductView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateProductView (
            minusButtonTapped: {
                print("Minus button was tapped")
                return()
            }, plusButtonTapped: {
                print("Plus button was tapped")
                return()
            }
        )
    }
}

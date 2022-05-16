//
//  FavoriteButton.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 2/05/22.
//

import SwiftUI

struct FavoriteButton: ButtonStyle {
    
    var state: Bool
        
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(state ? Color.blue : Color.white)
                .foregroundColor(state ? .white : .blue)
                .clipShape(Circle())
        }
}


struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            print("test")
        } label: {
            Image(systemName: "heart.fill")
        }
        .buttonStyle(FavoriteButton(state: false))

    }
}

//
//  ContentView.swift
//  MVVMSwiftUI
//
//  Created by Santiago Gómez Giraldo - Ceiba Software on 11/04/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            GridView()
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("Bookmark")
                }
            ListView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Search")
                }
            FavoriteView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}

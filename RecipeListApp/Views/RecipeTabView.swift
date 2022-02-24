//
//  RecipeTabView.swift
//  RecipeListApp
//
//  Created by Anand Narayan on 2022-02-13.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView{
            RecipeFeaturedView().tabItem{
                VStack {
                    Image(systemName: "star.fill")
                    Text("Featured")
                }
            }
            RecipeListView().tabItem{
                VStack {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
            }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
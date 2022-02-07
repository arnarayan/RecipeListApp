//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Anand Narayan on 2022-02-05.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        ScrollView{
            ForEach(model.recipes) { r in
                HStack(){
                    Image(r.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50, alignment: .center)
                        .clipped()
                        .cornerRadius(5)
                    Text(r.name)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}

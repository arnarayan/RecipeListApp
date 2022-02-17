//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Anand Narayan on 2022-02-08.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    
    var body: some View {
        
        
        ScrollView {
            VStack(alignment: .leading) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()

                .padding(.bottom, 1.0)
                
                
                VStack(alignment: .leading) {
                    Text("Ingredients").font(.headline).padding([.leading, .bottom], 2.0)
                    ForEach(recipe.ingredients) { ingredient in
                        Text("* " + ingredient.name)
                            .padding([.leading, .bottom], 1.0)
                    }
                }
                .padding(.horizontal, 10.0)

                Divider()
                VStack(alignment: .leading) {
                    Text("Directions").font(.headline).padding([.leading, .bottom], 2.0)
                    ForEach(0..<recipe.directions.count, id:\.self) { index in
                        Text("\(String(index+1)). \(recipe.directions[index])")
                            .padding([.leading, .bottom], 1.0)
                    }
                }
                .padding(.horizontal, 10.0)
 
            }

        }.navigationTitle(recipe.name)
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}

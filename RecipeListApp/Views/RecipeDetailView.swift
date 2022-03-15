//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Anand Narayan on 2022-02-08.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State var selectedServingSize = 2
    var body: some View {
        
        
        ScrollView {
            VStack(alignment: .leading) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()

                .padding(.bottom, 1.0)
                
                Text(recipe.name)
                    .bold()
                    .padding([.leading])
                    .font(.largeTitle)
                
                VStack(alignment:.leading){
                    Text("select your servings").font(.footnote)
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(.segmented)
                        .frame(width: 150, height: 25, alignment: .center)
                }.padding([.leading])
                
                
                VStack(alignment: .leading) {
                    
                    Text("Ingredients").font(.headline).padding([.leading, .bottom], 2.0)
                    ForEach(recipe.ingredients) { ingredient in
                        HStack(alignment:.bottom, spacing: 0) {
                            Text("- \(String(RecipeModel.calculatePortion(recipeServings: recipe.servings, targetServings: selectedServingSize, ingredient: ingredient)))")
                            Text(" \(ingredient.name.lowercased())")
                        }.padding([.leading, .bottom], 1.0)
                        .font(.footnote)


                    }
                }.padding(.horizontal, 10.0)

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

        }
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}

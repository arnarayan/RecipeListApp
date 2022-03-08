//
//  ContentView.swift
//  RecipeListApp
//
//  Created by Anand Narayan on 2022-02-05.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model: RecipeModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                Text("All Recipes")
                    .bold()
                    .padding([.top, .leading])
                    .font(.largeTitle)
                ScrollView{
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
                            NavigationLink(destination: RecipeDetailView(recipe: r), label: {
                                HStack(){
                                    Image(r.image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    Text(r.name)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(.black)
                                }
                                
                            })

                        }
                    }
                    .padding()

                }

            }.navigationBarHidden(true)

                
                
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView().environmentObject(RecipeModel())
    }
}

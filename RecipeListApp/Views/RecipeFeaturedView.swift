//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by Anand Narayan on 2022-02-16.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeModel
    @State var selectedIndex: Int = 0
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            Text("Featured Recipes")
                .bold()
                .padding([.top, .leading])
                .font(.largeTitle)
                
            GeometryReader { geo in
                
                TabView(selection: $selectedIndex) {
                    ForEach (0..<model.recipes.count) { index in
                        if (model.recipes[index].featured==true) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.white)
                                    

                                VStack(spacing:0) {
                                    Image(model.recipes[index].image)
                                        .resizable()
                                        .clipped()
                                        .aspectRatio(contentMode: .fill)
                                    Text(model.recipes[index].name).padding(5)
                                    
                                }
                                
                            }.frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                             .cornerRadius(15)
                             .shadow(color: .gray, radius: 10)
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            
            VStack(alignment: .leading, spacing:10) {
                Text("Preptime: \(model.recipes[selectedIndex].prepTime)")
                Text("Cooktime: \(model.recipes[selectedIndex].cookTime)")
                Text("Highlights")
                
                ForEach(model.recipes[selectedIndex].highlights, id:\.self) { hgh in
                        Text(hgh).font(.footnote)
                }
                .padding(.leading)
                Text("Servings: \(model.recipes[selectedIndex].servings)")
            }.padding()
            
        }
        

        

        

    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView().environmentObject(RecipeModel())
    }
}

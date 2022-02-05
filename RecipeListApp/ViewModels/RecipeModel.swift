//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Anand Narayan on 2022-02-05.
//

import Foundation


class RecipeModel: ObservableObject {
    

    @Published var recipes = [Recipe]()
    
    init() {
        self.recipes = DataService.getLocalData()
    }
    
}

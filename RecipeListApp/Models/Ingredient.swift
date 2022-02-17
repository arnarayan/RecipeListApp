//
//  Ingredient.swift
//  RecipeListApp
//
//  Created by Anand Narayan on 2022-02-16.
//

import Foundation

class Ingredient: Identifiable, Decodable {
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
    
    
}

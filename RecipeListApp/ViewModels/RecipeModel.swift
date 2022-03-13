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
    
    static func calculatePortion(recipeServings:Int,targetServings:Int,  ingredient: Ingredient) -> String {
        var portion  = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if (ingredient.num != nil) {
            denominator += recipeServings
            numerator += targetServings
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            if (numerator > denominator) {
                wholePortions  = numerator / denominator
                
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            if (numerator > 0) {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            
            if (wholePortions>1) {
                if (unit == "bunch") {
                    unit = "bunches"
                }
                else if (unit=="leaf") {
                    unit = "leaves"
                }
                else if (unit == "cup") {
                    unit = "cups"
                }
            }
            
            
            return portion + " \(unit)"
            
        }
        return portion
    }
    
}

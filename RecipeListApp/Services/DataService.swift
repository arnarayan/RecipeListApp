//
//  DataService.swift
//  RecipeListApp
//
//  Created by Anand Narayan on 2022-02-05.
//

import Foundation


class DataService {
    
    static func getLocalData() -> [Recipe] {
        // Get path to the json file within the app bundle
        
        if let path = Bundle.main.path(forResource: "recipes", ofType: "json") {
            let fileUrl = URL(fileURLWithPath: path)
            
            do{
                let data = try Data(contentsOf: fileUrl)
                let decoder = JSONDecoder()
                let response = try decoder.decode([Recipe].self, from: data)

                for r in response {
                    r.id = UUID()
                }
                
                return response
                
            }
            catch{
                print("could not serialize")
                print(error)
            }
            
        }

        return [Recipe]()
    }
}

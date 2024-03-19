//
//  Meal.swift
//  Recipies
//
//  Created by Ilya Vinogradov on 3/18/24.
//

struct Meal: Decodable, Identifiable {
    var id: String
    
    let name: String
//    let instructions: String
//    let ingredientsAndMeasurements: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
//        case instructions
//        case ingredientsAndMeasurements
    }
}

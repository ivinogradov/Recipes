//
//  MealEndpoint.swift
//  Recipies
//
//  Created by Ilya Vinogradov on 3/18/24.
//
import Foundation

enum MealEndpoint: APIEndpoint {
    case getMeals
    case getMeal(mealId: String)
    
    var baseURL: URL {
        return URL(string: "https://themealdb.com/api/json/v1/1")!
    }

    var path: String {
        switch self {
        case .getMeals:
            return "/filter.php"
        case .getMeal:
            return "/lookup.php"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMeals:
            return .get
        case .getMeal(let mealId):
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getMeals:
            return ["c": "Dessert"]
        case .getMeal(let mealId):
            return ["i": mealId]
        }
    }
}

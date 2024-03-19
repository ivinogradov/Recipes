//
//  MealEndpoint.swift
//  Recipies
//
//  Created by Ilya Vinogradov on 3/18/24.
//
import Foundation

enum MealEndpoint: APIEndpoint {
    case getMeals
    
    var baseURL: URL {
        return URL(string: "https://themealdb.com/api/json/v1/1")!
    }

    var path: String {
        switch self {
        case .getMeals:
            return "/filter.php"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMeals:
            return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .getMeals:
            return ["c": "Dessert"]
        }
    }
}

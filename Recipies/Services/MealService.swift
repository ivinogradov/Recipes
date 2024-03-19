//
//  MealServiceProtocol.swift
//  Recipies
//
//  Created by Ilya Vinogradov on 3/18/24.
//
import Combine

protocol MealServiceProtocol {
    func getMeals() -> AnyPublisher<Meals, Error>
}

class MealService: MealServiceProtocol {
    let apiClient = URLSessionAPIClient<MealEndpoint>()
    
    func getMeals() -> AnyPublisher<Meals, Error> {
        return apiClient.request(.getMeals)
    }
}

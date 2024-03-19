//
//  MealsViewModel.swift
//  Recipies
//
//  Created by Ilya Vinogradov on 3/18/24.
//

import Combine
import Foundation

class MealsViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let mealService: MealServiceProtocol
    @Published var meals: [Meal] = []
    
    init(mealService: MealServiceProtocol) {
        self.mealService = mealService
    }
    
    func fetchMeals(){
        mealService.getMeals()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: {data in
                
            }, receiveValue: {[weak self] data in
                self?.meals = data.meals
            }).store(in: &cancellables)
    }
}

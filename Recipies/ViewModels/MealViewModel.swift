//
//  MealViewModel.swift
//  Recipies
//
//  Created by Ilya Vinogradov on 3/19/24.
//

import Combine
import Foundation

class MealViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let mealService: MealServiceProtocol
    @Published var meal: Meal?
    
    init(mealService: MealServiceProtocol) {
        self.mealService = mealService
    }
    
    func fetchMeal(mealId: String) {
        mealService.getMeal(mealId: mealId)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
            }, receiveValue: {[weak self] data in
                self?.meal = data.meals[0]
            })
            .store(in: &cancellables)
    }
}

//
//  MealListView.swift
//  Recipies
//
//  Created by Ilya Vinogradov on 3/18/24.
//

import SwiftUI

struct MealListView: View {
    @StateObject var viewModel = MealsViewModel(mealService: MealService())
    
    var body: some View {
        List(viewModel.meals) { meal in
            Text(meal.name)
        }
        .onAppear {
            viewModel.fetchMeals()
        }
    }
}

#Preview {
    MealListView()
}

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
        NavigationView {
            List(viewModel.meals) { meal in
                NavigationLink(destination: MealDetailsView(meal: meal)) {
                    Text(meal.name)
                }
            }
            .navigationTitle("Desserts")
            .onAppear {
                viewModel.fetchMeals()
            }
        }
    }
}

#Preview {
    MealListView()
}

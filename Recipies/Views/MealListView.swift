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
            VStack {
                if viewModel.meals.count == 0 {
                    ProgressView("Loading desserts...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    List(viewModel.meals.sorted(by: { $0.name < $1.name})) { meal in        // sort alphabetically
                        NavigationLink(destination: MealDetailsView(meal: meal)) {
                            Text(meal.name)
                        }
                    }
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

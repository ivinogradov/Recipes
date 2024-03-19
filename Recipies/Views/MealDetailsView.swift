//
//  MealDetailsView.swift
//  Recipies
//
//  Created by Ilya Vinogradov on 3/19/24.
//

import SwiftUI

struct MealDetailsView: View {
    var meal: Meal
    var body: some View {
        VStack {
            Form {
                if let ingredients = meal.ingredients {
                    Section(header: Text("Ingredients").font(.headline)) {
                        ForEach(Array(ingredients).sorted(by: {$0.0 < $1.0}), id: \.0) { ingredient, measure in
                            HStack {
                                Text(ingredient)
                                Spacer()
                                Text(measure).foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                
                Section(header: Text("Instructions").font(.headline)) {
                    Text(meal.instructions ?? "No instructions here. Improvise!")
                }
            }
        }
        .navigationTitle(meal.name)
    }
}

#Preview {
    NavigationView {
        MealDetailsView(meal: testData)
    }
}

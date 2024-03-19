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
        Text(meal.name)
        Text(meal.id)
    }
}

#Preview {
    MealDetailsView(meal: testData)
}

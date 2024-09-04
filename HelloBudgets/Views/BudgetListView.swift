//
//  BudgetListView.swift
//  HelloBudgets
//
//  Created by Justin Maronde on 9/4/24.
//

import SwiftUI

struct BudgetListView: View {
    let budgetCategoryResults: FetchedResults<BudgetCategory>
    var body: some View {
        List {
            if !budgetCategoryResults.isEmpty {
                ForEach(budgetCategoryResults) { budgetCategory in
                    HStack {
                        Text(budgetCategory.title ?? "")
                        Spacer()
                        VStack {
                            Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                        }
                    }
                }
            } else {
                Text("No Budgets Categories Found!")
            }
        }
    }
}


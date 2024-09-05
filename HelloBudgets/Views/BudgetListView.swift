//
//  BudgetListView.swift
//  HelloBudgets
//
//  Created by Justin Maronde on 9/4/24.
//

import SwiftUI

struct BudgetListView: View {
    let budgetCategoryResults: FetchedResults<BudgetCategory>
    let onDeleteBudgetCategory: (BudgetCategory) -> Void
    
    var body: some View {
        List {
            if !budgetCategoryResults.isEmpty {
                ForEach(budgetCategoryResults) { budgetCategory in
                    NavigationLink(value: budgetCategory) {
                        HStack {
                            Text(budgetCategory.title ?? "")
                            Spacer()
                            VStack {
                                Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                            }
                        }
                    }
                }.onDelete { indexSet in
                    indexSet.map { budgetCategoryResults[$0] }.forEach(onDeleteBudgetCategory)
                }
                            
            } else {
                Text("No Budgets Categories Found!")
            }
        }.navigationDestination(for: BudgetCategory.self) { budgetCategory in
                BudgetDetailView(budgetCategory: budgetCategory)
        }
    }
}


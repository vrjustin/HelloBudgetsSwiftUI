//
//  BudgetDetailView.swift
//  HelloBudgets
//
//  Created by Justin Maronde on 9/5/24.
//

import SwiftUI

struct BudgetDetailView: View {
    let budgetCategory: BudgetCategory
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text(budgetCategory.title ?? "")
                        .font(.largeTitle)
                    HStack {
                        Text("Budget:")
                        Text(budgetCategory.total as NSNumber, formatter: NumberFormatter.currency)
                    }.fontWeight(.bold)
                }
            }
            Spacer()
        }
    }
}

//#Preview {
//    BudgetDetailView(budgetCategory: BudgetCategory())
//}

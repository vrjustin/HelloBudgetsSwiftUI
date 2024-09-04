//
//  ContentView.swift
//  HelloBudgets
//
//  Created by Justin Maronde on 9/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: []) private var budgetCategoryResults: FetchedResults<BudgetCategory>
    @State private var isPresented: Bool = false
    
    var total: Double {
        budgetCategoryResults.reduce(0) { result, budgetCategory in
            return result + budgetCategory.total
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text(total as NSNumber, formatter: NumberFormatter.currency)
                    .fontWeight(.bold)
                BudgetListView(budgetCategoryResults: budgetCategoryResults) { budgetCategory in
                    viewContext.delete(budgetCategory)
                    do {
                        try viewContext.save()
                    } catch {
                        print(error)
                    }
                }
            }
            .sheet(isPresented: $isPresented, content: {
                AddBudgetCategoryView()
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Category") {
                        isPresented = true
                    }
                }
            }.padding()
        }
        
    }
}

#Preview {
    ContentView()
}

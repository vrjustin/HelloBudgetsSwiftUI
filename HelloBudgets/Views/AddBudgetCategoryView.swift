//
//  AddBudgetCategory.swift
//  HelloBudgets
//
//  Created by Justin Maronde on 9/4/24.
//

import SwiftUI

struct AddBudgetCategoryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var total: Double = 100
    @State private var messages: [String] = []
    
    var isFormValid: Bool {
        messages.removeAll()
        if title.isEmpty {
            messages.append("Title is required!")
        }
        if total <= 0 {
            messages.append("Total should be greater than 1")
        }
        
        return messages.count == 0
    }
    
    private func save() {
        let budgetCategory = BudgetCategory(context: viewContext)
        budgetCategory.title = title
        budgetCategory.total = total
        do {
            try viewContext.save()
            dismiss()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                Slider(value: $total, in: 0...500, step: 50) {
                    Text("Total")
                } minimumValueLabel: {
                    Text("$0")
                } maximumValueLabel: {
                    Text("$500")
                }
                
                Text(total as NSNumber, formatter: NumberFormatter.currency)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                ForEach(messages, id: \.self) { message in
                    Text(message)
                }
                
            }.toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        if isFormValid {
                            save()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AddBudgetCategoryView()
}

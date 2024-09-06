//
//  TransactionListView.swift
//  HelloBudgets
//
//  Created by Justin Maronde on 9/6/24.
//

import SwiftUI
import CoreData

struct TransactionListView: View {
    @FetchRequest var transactions: FetchedResults<Transaction>
    
    init(request: NSFetchRequest<Transaction>) {
        _transactions = FetchRequest(fetchRequest: request)
    }
    
    var body: some View {
        if transactions.isEmpty {
            Text("No Transactions Available")
        } else {
            List {
                ForEach(transactions) { transaction in
                    HStack {
                        Text(transaction.title ?? "")
                        Spacer()
                        Text(transaction.total as NSNumber, formatter: NumberFormatter.currency)
                    }
                }
            }
        }
    }
}

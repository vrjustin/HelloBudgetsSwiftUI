//
//  BudgetCategorty+CoreDataClass.swift
//  HelloBudgets
//
//  Created by Justin Maronde on 9/4/24.
//

import Foundation
import CoreData

@objc(BudgetCategory)
public class BudgetCategory: NSManagedObject {
    
    public override func awakeFromInsert() {
        self.dateCreated = Date()
    }
}

//
//  Transaction+CoreDataClass.swift
//  HelloBudgets
//
//  Created by Justin Maronde on 9/5/24.
//

import Foundation
import CoreData

@objc(Transaction)
public class Transaction: NSManagedObject {
    public override func awakeFromInsert() {
        self.dateCreated = Date()
    }
}

//
//  HelloBudgetsApp.swift
//  HelloBudgets
//
//  Created by Justin Maronde on 9/4/24.
//

import SwiftUI

@main
struct HelloBudgetsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}

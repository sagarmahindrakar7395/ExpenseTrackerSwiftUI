//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Sagar Mahindrakar on 06/04/22.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
   @StateObject var transactionlistVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionlistVM)
        }
    }
}

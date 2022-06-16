//
//  transactionList.swift
//  ExpenseTracker
//
//  Created by Sagar Mahindrakar on 11/04/22.
//

import SwiftUI

struct transactionList: View {
    
    @EnvironmentObject var transactionListVM: TransactionListViewModel
    
    var body: some View {
        VStack {
            List{
                // MARK: Transaction Groups
                ForEach(Array(transactionListVM.groupTransactionByMonth()), id: \.key) { month, transactions in
                    Section {
                        // MARK: Transaction List
                        ForEach(transactions) { transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        
                        //MARK: Transaction Month
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)

                }
            }
            .listStyle(.plain)
            
        }
        .navigationTitle("Transactions")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct transactionList_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    static var previews: some View {
        Group {
            NavigationView {
                transactionList()
            }
            NavigationView {
                transactionList()
                    .preferredColorScheme(.dark)
            }
        }
        .environmentObject(transactionListVM)
    }
}

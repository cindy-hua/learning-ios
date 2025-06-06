//
//  AddView.swift
//  Project7_iExpense
//
//  Created by HUA Cindy on 10/01/2025.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = "Expense's name"
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.pink.opacity(0.5),.yellow.opacity(0.7) , .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                Color(.white)
                    .opacity(0.3)
                    .ignoresSafeArea()
                Form {
//                    Deleted for testing the name in the toolbar:
                    
//                    TextField("Name", text: $name)
//                        .padding()
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(Color(.systemGray6))
//                        )
//                        .padding(.vertical, 5)
                    
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.vertical, 5)
                    
                    TextField("Amount", value: $amount, format: .currency(code: "USD"))
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(.systemGray6))
                        )
                        .padding(.vertical, 5)
                }
                .navigationTitle($name)
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    Button("Save") {
                        let item = ExpenseItem(name: name, type: type, amount: amount)
                        if type == "Personal" {
                            expenses.personalItems.append(item)
                        } else {
                            expenses.businessItems.append(item)
                        }
                        dismiss()
                    }
                }
            }
        }
        .scrollContentBackground(.hidden)
        .opacity(0.8)
    }
}

#Preview {
    AddView(expenses: Expenses())
}

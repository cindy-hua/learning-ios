//
//  ContentView.swift
//  Project7_iExpense
//
//  Created by HUA Cindy on 10/01/2025.
//

import Observation
import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}

struct ListModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scrollContentBackground(.hidden)
    }
}

struct ElementModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowBackground(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(white: 1, opacity: 0.5))
                    .padding(.vertical, 2).padding(.horizontal, 5)
            )
    }
}

struct BigTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding(.bottom, 5)
            .foregroundStyle(.white)
    }
}


@Observable
class Expenses {
    var personalItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(personalItems) {
                UserDefaults.standard.set(encoded, forKey: "PersonalItems")
            }
        }
    }
    
    var businessItems = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(businessItems) {
                UserDefaults.standard.set(encoded, forKey: "BusinessItems")
            }
        }
    }
    
    init() {
            if let savedPersonalItems = UserDefaults.standard.data(forKey: "PersonalItems"),
               let decodedPersonalItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedPersonalItems) {
                personalItems = decodedPersonalItems
            }

            if let savedBusinessItems = UserDefaults.standard.data(forKey: "BusinessItems"),
               let decodedBusinessItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedBusinessItems) {
                businessItems = decodedBusinessItems
            }
        }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.pink.opacity(0.5),.yellow.opacity(0.7) , .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Personal Expenses")
                        .modifier(BigTitle())
                    
                    List {
                        ForEach(expenses.personalItems) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundStyle((item.amount < 10 ? .green : (item.amount < 100 ? .orange : .red)))
                            }
                        }
                        .onDelete(perform: removePersonalItems)
                        .modifier(ElementModifier())
                    }
                    .modifier(ListModifier())
                    
                    
                    Text("Business Expenses")
                        .modifier(BigTitle())
                    
                    List() {
                        ForEach(expenses.businessItems) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                                    .foregroundStyle((item.amount < 10 ? .green : (item.amount < 100 ? .orange : .red)))
                            }
                        }
                        .onDelete(perform: removeBusinessItems)
                        .modifier(ElementModifier())
                    }
                    .modifier(ListModifier())
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                NavigationLink("Add") {
                    AddView(expenses: expenses)
                }
            }
        }
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        expenses.personalItems.remove(atOffsets: offsets)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        expenses.businessItems.remove(atOffsets: offsets)
    }
    
    func amountRange(amount: Double, small: Double, medium: Double, high: Double) -> Double {
        if amount < 10.0 {
            return small
        } else if amount < 100.0 {
            return medium
        } else {
            return high
        }
    }
}

#Preview {
    ContentView()
}

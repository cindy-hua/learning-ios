//
//  ContentView.swift
//  Project12_SwiftData
//
//  Created by HUA Cindy on 17/01/2025.
//

import SwiftData
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

class SortState: ObservableObject {
    @Published var sortOrder: Expenses.SortOrder = .name
}


@Model
class Expenses {
    var personalItems: [ExpenseItem]
    var businessItems: [ExpenseItem]
    
    init(personalItems: [ExpenseItem], businessItems: [ExpenseItem]) {
        self.personalItems = personalItems
        self.businessItems = businessItems
    }
    
    enum SortOrder {
        case name, amount
    }
    
    func sortedPersonalItems(by sortOrder: SortOrder) -> [ExpenseItem] {
        switch sortOrder {
        case .name:
            return personalItems.sorted { $0.name < $1.name }
        case .amount:
            return personalItems.sorted { $0.amount < $1.amount }
        }
    }
    
    func sortedBusinessItems(by sortOrder: SortOrder) -> [ExpenseItem] {
        switch sortOrder {
        case .name:
            return businessItems.sorted { $0.name < $1.name }
        case .amount:
            return businessItems.sorted { $0.amount < $1.amount }
        }
    }
}

struct ContentView: View {
    @Bindable var expenses: Expenses
    @StateObject private var sortState = SortState()
    @State var showingAddExpense = false
    
    init(expenses: Expenses = Expenses(personalItems: [], businessItems: []), showingAddExpense: Bool = false) {
            self.expenses = expenses
            self._showingAddExpense = State(initialValue: showingAddExpense)
        }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.pink.opacity(0.5),.yellow.opacity(0.7) , .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Personal Expenses")
                        .modifier(BigTitle())
                    
                    List {
                        ForEach(expenses.sortedPersonalItems(by: sortState.sortOrder)) { item in
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
                        ForEach(expenses.sortedBusinessItems(by: sortState.sortOrder)) { item in
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
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Menu {
                        Button("Sort by Name") {
                            sortState.sortOrder = .name
                        }
                        Button("Sort by Amount") {
                            sortState.sortOrder = .amount
                        }
                    } label: {
                        Label("Sort", systemImage: "arrow.up.arrow.down.circle")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Expense", systemImage: "plus") {
                        showingAddExpense = true
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
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
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Expenses.self, configurations: config)
        let initialExpenses = Expenses(personalItems: [], businessItems: [])
        return ContentView(expenses: initialExpenses, showingAddExpense: false)
            .modelContainer(container)
    } catch {
        return AnyView(Text("Failed to create container: \(error.localizedDescription)"))
    }
}

//
//  ContentView.swift
//  Grocery List
//
//  Created by Javier Jara Montoya on 9/9/25.
//

import SwiftUI
import SwiftData
import TipKit

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var item: String = ""
    @FocusState private var isFocused: Bool

    let buttonTip = ButtonTip()
    
    init() {
//        setupTips()
        try? Tips.configure()
    }
    
    func setupTips () {
        do {
            try Tips.resetDatastore()
            Tips.showAllTipsForTesting()
            try Tips.configure([.displayFrequency(.immediate)])
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }

    func addEssencialFoods() {
        modelContext.insert(Item(title: "Pasta", isCompleted: false))
        modelContext.insert(Item(title: "Rice", isCompleted: .random()))
        modelContext.insert(Item(title: "Beans", isCompleted: .random()))
        modelContext.insert(Item(title: "Olive oil", isCompleted: false))
        modelContext.insert(Item(title: "Beer", isCompleted: true))
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    Text(item.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .foregroundStyle(item.isCompleted ? Color.accentColor : Color.primary)
                        .strikethrough(item.isCompleted)
                        .italic(item.isCompleted)
                        .swipeActions(content: {
                            Button(role: .destructive) {
                                withAnimation {
                                    modelContext.delete(item)
                                }
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        })
                        .swipeActions(edge: .leading) {
                            Button("Done", systemImage: item.isCompleted ? "checkmark.circle" : "x.circle") {
                                item.isCompleted.toggle()
                            }
                            .tint(item.isCompleted ? .accentColor : .green)
                        }
                }
            }
            .toolbar {
                if items.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            addEssencialFoods()
                        } label: {
                            Image(systemName: "carrot")
                        }
                        .popoverTip(buttonTip)
                    }
                }
            }
            .navigationTitle("Grocery List")
            .overlay {
                if items.isEmpty {
                    ContentUnavailableView("Emtpy Cart", systemImage: "cart.circle", description: Text("Add some items in to the shopping list"))
                }
            }
            .safeAreaInset(edge: .bottom, content: {
                VStack(spacing: 12){
                    TextField("", text: $item)
                        .textFieldStyle(.plain)
                        .padding(12)
                        .background(.tertiary)
                        .cornerRadius(12)
                        .font(.title.weight(.light))
                        .focused($isFocused)
                    Button {
                        guard !item.isEmpty else {
                            return
                        }
                        let newItem = Item(title: item, isCompleted: false)
                        modelContext.insert(newItem)
                        item = ""
                        isFocused = false
                    } label: {
                        Text("Save")
                            .font(.title2.weight(.medium))
                    }
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.roundedRectangle)
                    .controlSize(.extraLarge)
                    .frame(maxWidth: .infinity)
                }
                .padding()
                .background(.bar)
            })
        }
    }
}

#Preview("Basic Preview") {
    ContentView().modelContainer(for: Item.self, inMemory: true)
}

#Preview("Stub") {
    let container = try! ModelContainer(for:Item.self,
                                            configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    container.mainContext.insert(Item(title: "Pasta", isCompleted: false))
    container.mainContext.insert(Item(title: "Rice", isCompleted: .random()))
    container.mainContext.insert(Item(title: "Beans", isCompleted: .random()))
    container.mainContext.insert(Item(title: "Olive oil", isCompleted: false))
    container.mainContext.insert(Item(title: "Beer", isCompleted: true))
    return ContentView().modelContainer(container)
}

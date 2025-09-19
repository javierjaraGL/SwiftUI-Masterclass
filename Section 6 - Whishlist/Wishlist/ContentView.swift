//
//  ContentView.swift
//  Whishlist
//
//  Created by Javier Jara Montoya on 9/9/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContenxt
    @Query private var wishes: [Wish]
    
    @State private var isAlertShowing = false
    @State private var title: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(wishes) { wish in
                    Text (wish.title)
                        .font(.title.weight(.light))
                        .padding(.vertical, 2)
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                ModelContext.delete(wish)
                            }
                        }
                }
            }
            .navigationTitle("Whishlist")
            .overlay {
                if wishes.isEmpty {
                    ContentUnavailableView("My Wishlist",
                                           systemImage: "heart.circle",
                                           description: Text("No wishes yet. Add one to get started"))
                    
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isAlertShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.large)
                    }
                }
                if !wishes.isEmpty {
                    Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
                }
            }
            .alert("Create a new wish", isPresented: $isAlertShowing) {
                TextField("Enter a wish", text: $title)
                Button {
                    modelContenxt.insert(Wish(title: title))
                    title = ""
                } label : {
                    Text("Save")
                }
             }
        }
    }
}

#Preview("Empty List") {
    ContentView().modelContainer(for: Wish.self, inMemory: true)
}

#Preview("Sample Data") {
    let container = try! ModelContainer(for:Wish.self,
                                        configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    container.mainContext.insert(Wish(title: "Master Swift Data"))
    container.mainContext.insert(Wish(title: "Buy new iPhone"))
    container.mainContext.insert(Wish(title: "Practice latin dances"))
    container.mainContext.insert(Wish(title: "Travel to Europe"))
    container.mainContext.insert(Wish(title: "Make positive impact"))

    return ContentView().modelContainer(container)
}

//
//  ContentView.swift
//  Todo App
//
//  Created by Javier Jara Montoya on 23/9/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)],
        animation: .default)
    private var todos: FetchedResults<Todo>

    @EnvironmentObject var iconSettings: IconNames
    
    @State private var showingSettingsView: Bool = false
    @State private var showingAddTodoView: Bool = false
    @State private var animatingButton: Bool = false
    
    // THEME
    @ObservedObject var theme = ThemeSettings.shared
    var themes: [Theme] = themeData
   

    // MARK: - Functions
    private func addItem() {
        withAnimation {
            let newItem = Todo(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { todos[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    // OLD
//    private func deleteTodo(at offsets: IndexSet) {
//      for index in offsets {
//        let todo = todos[index]
//          viewContext.delete(todo)
//        
//        do {
//          try viewContext.save()
//        } catch {
//          print(error)
//        }
//      }
//    }

    private func colorize(priority: String) -> Color {
      switch priority {
      case "High":
        return .pink
      case "Normal":
        return .green
      case "Low":
        return .blue
      default:
        return .gray
      }
    }

    
    // MARK: - Body
    var bodys_old: some View {
        NavigationView {
            List {
                ForEach(todos) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter), name: \(item.name ?? "No Name")")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }
    
    var body: some View {
      NavigationView {
        ZStack {
          List {
            ForEach(self.todos, id: \.self) { todo in
              HStack {
                Circle()
                  .frame(width: 12, height: 12, alignment: .center)
                  .foregroundColor(self.colorize(priority: todo.priority ?? "Normal"))
                Text(todo.name ?? "Unknown")
                  .fontWeight(.semibold)
                
                Spacer()
                
                Text(todo.priority ?? "Unkown")
                  .font(.footnote)
                  .foregroundColor(Color(UIColor.systemGray2))
                  .padding(3)
                  .frame(minWidth: 62)
                  .overlay(
                    Capsule().stroke(Color(UIColor.systemGray2), lineWidth: 0.75)
                )
              } //: HSTACK
                .padding(.vertical, 10)
            } //: FOREACH
            .onDelete(perform: deleteItems)
          } //: LIST
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(
              leading: EditButton().accentColor(themes[self.theme.themeSettings].themeColor),
              trailing:
              Button(action: {
                self.showingSettingsView.toggle()
              }) {
                Image(systemName: "paintbrush")
                  .imageScale(.large)
              } //: SETTINGS BUTTON
                .accentColor(themes[self.theme.themeSettings].themeColor)
                .sheet(isPresented: $showingSettingsView) {
                  SettingsView().environmentObject(self.iconSettings)
              }
          )
          
          // MARK: - NO TODO ITEMS
          if todos.count == 0 {
            EmptyListView()
          }
        } //: ZSTACK
          .sheet(isPresented: $showingAddTodoView) {
            AddTodoView().environment(\.managedObjectContext, self.viewContext)
          }
          .overlay(
            ZStack {
              Group {
                Circle()
                  .fill(themes[self.theme.themeSettings].themeColor)
                  .opacity(self.animatingButton ? 0.2 : 0)
                  //.scaleEffect(self.animatingButton ? 1 : 0)
                  .frame(width: 68, height: 68, alignment: .center)
                Circle()
                  .fill(themes[self.theme.themeSettings].themeColor)
                  .opacity(self.animatingButton ? 0.15 : 0)
                  //.scaleEffect(self.animatingButton ? 1 : 0)
                  .frame(width: 88, height: 88, alignment: .center)
              }
              //.animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true))
              
              Button(action: {
                self.showingAddTodoView.toggle()
              }) {
                Image(systemName: "plus.circle.fill")
                  .resizable()
                  .scaledToFit()
                  .background(Circle().fill(Color("ColorBase")))
                  .frame(width: 48, height: 48, alignment: .center)
              } //: BUTTON
                .accentColor(themes[self.theme.themeSettings].themeColor)
                .onAppear(perform: {
                   self.animatingButton.toggle()
                })
            } //: ZSTACK
              .padding(.bottom, 15)
              .padding(.trailing, 15)
              , alignment: .bottomTrailing
          )
      } //: NAVIGATION
        .navigationViewStyle(StackNavigationViewStyle())
    }
    


}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

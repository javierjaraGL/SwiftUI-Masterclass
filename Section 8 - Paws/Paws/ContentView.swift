//
//  ContentView.swift
//  Paws
//
//  Created by Javier Jara Montoya on 10/9/25.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var pets: [Pet]
    let layout = [GridItem(.flexible(minimum: 120)), GridItem(.flexible(minimum: 120))]
    @State private var path = [Pet]()
    @State private var isEditing = false
    
    func addPet() {
        isEditing = false
        let pet = Pet(name: "Best Friend")
        modelContext.insert(pet)
        path = [pet]
    }
    
    func saveAnimated() {
        modelContext.delete(pet)
        try? modelContext.save()
    }

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                LazyVGrid(columns: layout) {
                    GridRow {
                        ForEach(pets) { pet in
                            NavigationLink(value: pet) {
                                VStack {
                                    if let imageData = pet.photo,
                                        let image = UIImage(data: imageData) {
                                            Image(uiImage: image)
                                            .resizable()
                                            .scaledToFit()
                                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                                    } else {
                                        Image(systemName: "pawprint.circle")
                                            .resizable()
                                            .scaledToFit()
                                            .padding(40)
                                            .foregroundStyle(.quaternary)
                                    }
                                    Spacer()
                                    Text(pet.name)
                                        .font(.title.weight(.light))
                                        .padding(.vertical)
                                }//: VStack
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                                .background(.ultraThinMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 9, style: .circular))
                                .overlay(alignment: .topTrailing) {
                                    if isEditing {
                                        Menu {
                                            Button("Delete", systemImage: "trash", role: .destructive) {
                                                withAnimation {
                                                    saveAnimated()
                                                }
                                            }
                                        } label: {
                                            Image(Image(systemName: "trash.circle.fill"))
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 35, height: 36)
                                                .foregroundStyle(.red)
                                                .symbolRenderingMode(.multicolor)
                                                .padding()
                                        }
                                    }
                                }
                            } //: NavLink
                            .foregroundStyle(.primary)
                        }//: Looop
                    }//: GridRow
                }//: Grid Layout
                .padding(.horizontal)
            } // : Scroll View
            .navigationTitle(pets.isEmpty ? "" : "Paws")
            .navigationDestination(for: Pet.self, destination: EditPetView.init)
            .overlay {
                if pets.isEmpty {
                    CustomContentUnavailableView(
                        icon: "dog.circle",
                        title: "No Pets",
                        description: "Add a new pet to get started.")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add a New Pet", systemImage: "plus.circle", action: addPet)
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            isEditing.toggle()
                        }
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
            
        } //: Navstack
    }
}

#Preview("No Data") {
    ContentView()
        .modelContainer(for: Pet.self, inMemory: true)
}

#Preview("Sample Data") {
    ContentView().modelContainer(Pet.preview)
}

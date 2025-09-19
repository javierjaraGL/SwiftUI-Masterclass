//
//  NewMovieFormView.swift
//  Watchlist
//
//  Created by Javier Jara Montoya on 10/9/25.
//

import SwiftUI

struct NewMovieFormView: View {
    //MARK: - Properties
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var title: String = ""
    @State private var selectedGenre: Genre = .kids
    var isFormValid: Bool {
        return title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    //MARK: - Function
    
    private func addNewMmovie() {
        let newMovie = Movie(title: title, genre: selectedGenre)
        modelContext.insert(newMovie)
        title = ""
        selectedGenre = .kids
    }
    
    var body: some View {
        Form {
            List {
                //MARK: - Header
                Text("What to watch")
                    .font(.largeTitle.weight(.black))
                    .foregroundStyle(.blue.gradient)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)
                //MARK: - Tittle
                TextField("Movie Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                    .font(.largeTitle.weight(.light))
                    
                // MARK: - Genre
                Picker("Genre", selection: $selectedGenre) {
                    ForEach(Genre.allCases) { genre in
                        Text(genre.name)
                            .tag(genre)
                    }
                }

                // MARK: - Save Button
                Button {
                    if isFormValid {
                        print("Input is invalid")
                        return
                    } else {
                        print("valid input \(title) - \(selectedGenre)")
                        addNewMmovie()
                        dismiss()
                    }
                } label: {
                    Text("Save")
                        .font(.title2.weight(.medium))
                        .frame(maxWidth: .infinity)
                }
                .disabled(isFormValid)
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .buttonBorderShape(.roundedRectangle)

                // MARK: - Cancel Button
                Button {
                    dismiss()
                } label: {
                    Text("Close")
                        .frame(maxWidth: .infinity)
                }
            }//: LIST
        }//: FORM
    }
}

#Preview {
    NewMovieFormView()
}

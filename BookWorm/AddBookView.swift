//
//  AddBookView.swift
//  BookWorm
//
//  Created by Aryan Panwar on 24/07/24.
//

import SwiftData
import SwiftUI

struct AddBookView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title : String = ""
    @State private var author : String = ""
    @State private var genre : String = "Fantasy"
    @State private var review  :String = ""
    @State private var rating : Int = 3
    
    let genres = ["Fantasy" , "Horror" , "Kids" , "Mystery" , "Poetry" , "Romance" , "Thriller" ]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField ("Enter name of the book " , text : $title)
                    TextField(" Author's name " , text : $author)
                    
                    Picker ("Genere" , selection: $genre){
                        ForEach(genres , id : \.self){
                            Text($0)
                        }
                    }
                }
                
                Section(" Write a review") {
                    TextEditor(text : $review)
                    
                    RatingView(rating : $rating)
                }
                
                    Button("Save"){
                      let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating )
                        modelContext.insert(newBook)
                        dismiss()
                    }
                    .disabled(!isValid())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(isValid() ? .blue : .gray )
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
                
            }
            .navigationTitle("Add Book")
        }
    }
    
    func isValid() -> Bool{
        if title.trimmingCharacters(in: .whitespaces) != "" && author.trimmingCharacters(in: .whitespaces) != "" {
            return true
        } else {
            return false
        }
    }
}

#Preview {
    AddBookView()
}

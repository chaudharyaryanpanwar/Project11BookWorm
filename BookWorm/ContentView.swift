//
//  ContentView.swift
//  BookWorm
//
//  Created by Aryan Panwar on 24/07/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
//    @Query var books : [Book]
//    @Query(sort : \Book.title) var books : [Book]
//    @Query(sort : \Book.rating , order : .reverse) var books : [Book]
    
//    multiple sorting in chain for better results
    @Query(sort : [
        SortDescriptor(\Book.title) ,
        SortDescriptor(\Book.author)
    ]) var books : [Book]
    
    @State private var showingAddScreen  : Bool = false
    
    var body: some View {
        NavigationStack {
            if books.isEmpty {
                EmptyContentView(showingAddScreen: $showingAddScreen)
                    .padding(.top , 50)
            }
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .foregroundStyle(book.rating == 1 ? .red : .primary)
                                    .font(.headline)
                                
                                Text(book.author)
                                    .foregroundStyle(book.rating == 1 ? .red : .secondary)
                            }
                            .background()
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .toolbar {
                if !books.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                }
            }
            .sheet(isPresented: $showingAddScreen, content: {
                AddBookView()
            })
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            
            }
            .navigationTitle("BookWorm")
        }
        
    }
    
    func deleteBooks(at offsets : IndexSet){
        for offset in offsets {
            let book = books[offset]
            
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}


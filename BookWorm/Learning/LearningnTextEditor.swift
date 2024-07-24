//
//  LearningnTextEditor.swift
//  BookWorm
//
//  Created by Aryan Panwar on 24/07/24.
//

import SwiftUI
//we can create the world's smallest notes app by combining TextEditor with @AppStorage

struct LearningnTextEditor : View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextEditor(text: $notes)
                    .navigationTitle("Notes")
                    .padding()
            }
        }
    }
}

struct GrowingTextField: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter your text", text: $notes , axis : .vertical)
                    .textFieldStyle(.roundedBorder)
                    .navigationTitle("Notes")
                    .padding()
            }
        }
    }
}

#Preview {
//    LearningnTextEditor()
    GrowingTextField()
}

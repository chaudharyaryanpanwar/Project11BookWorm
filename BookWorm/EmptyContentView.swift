//
//  EmptyContentView.swift
//  BookWorm
//
//  Created by Aryan Panwar on 24/07/24.
//

import SwiftUI

struct EmptyContentView: View {
    
    @Binding var showingAddScreen : Bool
    
    var body: some View {
        Image(systemName: "book.circle")
            .font(.system(size: 200))
            .foregroundStyle(Color.accentColor)
//        Text("Add some Books")
        Button(action: {
            showingAddScreen = true
        }
        , label: {
            Label("Add Books", systemImage: "book.fill")
        })
        .padding()
        .background(.blue)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    EmptyContentView(showingAddScreen: .constant(false))
}

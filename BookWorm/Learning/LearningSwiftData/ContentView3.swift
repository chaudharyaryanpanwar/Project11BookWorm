//
//  ContentView3.swift
//  BookWorm
//
//  Created by Aryan Panwar on 24/07/24.
//

import SwiftData
import SwiftUI

struct ContentView3: View {
    
    @Query var students  : [Student]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List (students){ student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add"){
                    let firstNames = ["Ginny" , "Harry" , "Hermione" , "Luna" , "Ron"]
                    let lastNames = ["Granger" , "Lovegood" , "Potter" , "Weasley"]
                    
                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!
                    
                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView3()
}

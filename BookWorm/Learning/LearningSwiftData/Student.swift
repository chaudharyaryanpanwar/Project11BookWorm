//
//  Student.swift
//  BookWorm
//
//  Created by Aryan Panwar on 24/07/24.
//

import Foundation
import SwiftData

@Model
class Student {
    var id : UUID
    var name : String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}

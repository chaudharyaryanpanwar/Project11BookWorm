//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Aryan Panwar on 24/07/24.
//

import SwiftData
import SwiftUI

@main
struct BookWormApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView3() for learnign swift Data
            ContentView()
        }
//        .modelContainer(for :  Student.self) for learning SwiftData
        .modelContainer(for : Book.self)
    }
}

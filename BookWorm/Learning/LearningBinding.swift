//
//  LearningBinding.swift
//  BookWorm
//
//  Created by Aryan Panwar on 24/07/24.
//

import SwiftUI

struct PushButton1 : View {
    let title : String
    @Binding var isOn : Bool
    
    var onColors = [Color.red , Color.blue]
    var offColors = [Color(white : 0.6) , Color(white: 0.4)]
    
    var body: some View {
        Button(title){
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors : isOn ? onColors : offColors , startPoint: .top , endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView1 : View {
    @State private var remembreMe = false
    
    var body : some View {
        VStack {
            PushButton1(title: "Remember Me ", isOn: $remembreMe)
            Text(remembreMe ? "On" : "Off")
        }
    }
}

#Preview {
    PushButton1(title: "helo", isOn: .constant(false))
}



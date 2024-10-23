//
//  ContentView.swift
//  SwiftUIState Examples
//
//  Created by Sridhar Muthineni on 21/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            Text("The count is: \(count)")
            Button("Increment") {
                count += 1
            }
            HStack {
                Text("Name: ")
                TextField("Enter your name", text: $name)
            }
            HStack {
                Text("Your name is: \(name)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

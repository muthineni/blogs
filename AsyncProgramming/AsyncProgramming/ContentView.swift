//
//  ContentView.swift
//  AsyncProgramming
//
//  Created by Sridhar on 31/08/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = ContentViewModel()
    
    var body: some View {
        List(model.todos) { post in
            VStack(alignment: .leading) {
                Text("Title: " + post.title)
                Text("Completed: " + (post.completed ? "✅" : "❌"))
            }
        }
        .onAppear {
            Task {
                do {
                    model.todos = try await model.fetchPostsUsingAsyncAwait()
                } catch {
                    print("Failed to fetch posts: \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

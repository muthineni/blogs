//
//  ContentViewModel.swift
//  AsyncProgramming
//
//  Created by Sridhar on 31/08/2024.
//

import Foundation
import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    @Published var todos: [Todo] = []


    func fetchTodosUsingClosures() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Check if data is not nil
            guard let data = data else {
                print("No data received")
                return
            }
            
            // Parse JSON data into Post objects
            do {
                let decoder = JSONDecoder()
                let list = try decoder.decode([Todo].self, from: data)
                
                DispatchQueue.main.async {
                    self.todos = list
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func fetchTodosUsingDispatchQueue() {
        // Define the URL
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        
        // Perform the network request on a background queue
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now(), execute: DispatchWorkItem(block: {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                
                // Check if data is not nil
                guard let data = data else {
                    print("No data received")
                    return
                }
                
                // Parse JSON data into Post objects
                do {
                    let decoder = JSONDecoder()
                    let list = try decoder.decode([Todo].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.todos = list
                    }
                    
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
            
            // Start the data task
            task.resume()
        }))
    }
    
    

    private var cancellables = Set<AnyCancellable>() // To store the subscriptions
    
    func fetchTodosUsingCombine() {
        // Define the URL
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        
        // Create a Combine publisher with URLSession
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data } // Extract data from URLSession response
            .decode(type: [Todo].self, decoder: JSONDecoder()) // Decode JSON into an array of Todo
            .receive(on: DispatchQueue.main) // Ensure updates on the main thread
            .sink(
                receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        print("Successfully fetched and decoded posts.")
                    case .failure(let error):
                        print("Error fetching posts: \(error.localizedDescription)")
                    }
                },
                receiveValue: { [weak self] todos in
                    self?.todos = todos // Update the todos array
                }
            )
            .store(in: &cancellables) // Store the subscription
    }
    
    
     
    // Function to fetch todos using async/await
    func fetchPostsUsingAsyncAwait() async throws -> [Todo] {
        // Define the URL
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")!
        
        // Fetch data using URLSession's data(from:) method
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check if the response is an HTTP response and status code is 200
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        // Decode JSON data into Post objects
        let posts = try JSONDecoder().decode([Todo].self, from: data)
        
        return posts
    }

}

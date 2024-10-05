//
//  Dispatcher.swift
//  FluxPattern
//
//  Created by Sridhar Muthineni on 03/10/2024.
//

import Foundation

class Dispatcher {
    static let shared = Dispatcher()
    private init() {}
    
    private var callbacks: [String: (Any) -> Void] = [:]
    
    func register(actionName: String, callback: @escaping (Any) -> Void) {
        callbacks[actionName] = callback
    }
    
    func dispatch(actionName: String, action: Any) {
        callbacks[actionName]?(action)
    }
}

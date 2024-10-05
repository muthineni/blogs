//
//  PersonStore.swift
//  FluxPattern
//
//  Created by Sridhar Muthineni on 03/10/2024.
//

import Foundation

class PersonStore {
    static let shared = PersonStore()
    
    private var person: Person?
    
    // Listen to actions
    init() {
        Dispatcher.shared.register(actionName: "LOAD_PERSON") { action in
            guard let loadPersonAction = action as? LoadPersonAction else { return }
            self.person = loadPersonAction.person
            self.emitChange()
        }
    }
    
    private var listeners: [(Person?) -> Void] = []
    
    func addListener(listener: @escaping (Person?) -> Void) {
        listeners.append(listener)
    }
    
    private func emitChange() {
        listeners.forEach { $0(self.person) }
    }
    
    func getPerson() -> Person? {
        return person
    }
}

//
//  PersonViewModel.swift
//  MVVMExample
//
//  Created by Sridhar Muthineni on 13/09/2024.
//

import Foundation

struct PersonViewModel {
    private let person: Person
    
    init(person: Person) {
        self.person = person
    }
    
    // This transforms the model's data into a format suitable for the view
    var displayName: String {
        return "Name: \(person.name)"
    }
    
    var displayEmail: String {
        return "Email: \(person.email)"
    }
    
    var displayDob: String {
        return "DOB: \(person.dob)"
    }
    
    var displayAge: String {
        return "Age: \(person.age)"
    }
}

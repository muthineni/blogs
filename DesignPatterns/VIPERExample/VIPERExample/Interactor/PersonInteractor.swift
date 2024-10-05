//
//  PersonInteractorProtocol.swift
//  VIPERExample
//
//  Created by Sridhar Muthineni on 13/09/2024.
//

import Foundation

protocol PersonInteractorProtocol: AnyObject {
    func fetchPerson() -> Person
}

class PersonInteractor: PersonInteractorProtocol {
    func fetchPerson() -> Person {
        return Person(name: "Sridhar Muthineni", email: "sri@example.com", dob: "12-12-1999")
    }
}

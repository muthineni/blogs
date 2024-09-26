//
//  PersonPresenterProtocol.swift
//  MVPExample
//
//  Created by Sridhar Muthineni on 14/09/2024.
//

import Foundation

protocol PersonPresenterProtocol: AnyObject {
    func loadPersonData()
}

class PersonPresenter: PersonPresenterProtocol {
    
    private weak var view: PersonViewProtocol?
    private var person: Person
    
    init(view: PersonViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }
    
    func loadPersonData() {
        // Process the person data and send it to the view
        let displayName = "Name: \(person.name)"
        let displayEmail = "Email: \(person.email)"
        let displayDob = "DOB: \(person.dob)"
        let displayAge = "Age: \(person.age)"
        
        // Pass the data to the view to update UI
        view?.showPersonData(name: displayName, email: displayEmail, dob: displayDob, age: displayAge)
    }
}

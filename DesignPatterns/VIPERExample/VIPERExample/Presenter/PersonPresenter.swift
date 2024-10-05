//
//  PersonPresenter.swift
//  VIPERExample
//
//  Created by Sridhar Muthineni on 13/09/2024.
//

import Foundation

protocol PersonPresenterProtocol: AnyObject {
    func viewDidLoad()
}

class PersonPresenter: PersonPresenterProtocol {
    
    weak var view: PersonViewProtocol?
    var interactor: PersonInteractorProtocol?
    
    init(view: PersonViewProtocol, interactor: PersonInteractorProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        let person = interactor?.fetchPerson()
        
        guard let person = person else { return }
        
        // Transform data and pass it to the view
        let displayName = "Name: \(person.name)"
        let displayEmail = "Email: \(person.email)"
        let displayDob = "DOB: \(person.dob)"
        let displayAge = "Age: \(person.age)"
        
        view?.showPersonInfo(name: displayName, email: displayEmail, dob: displayDob, age: displayAge)
    }
}

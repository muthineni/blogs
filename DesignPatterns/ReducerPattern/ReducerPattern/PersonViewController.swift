//
//  PersonViewController.swift
//  ReducerPattern
//
//  Created by Sridhar Muthineni on 04/10/2024.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    let personStore = Store<AppState, PersonAction>(initialState: AppState(), reducer: personReducer)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personStore.subscribe { [weak self] state in
            if let person = state.person {
                self?.nameLabel.text = person.name
                self?.emailLabel.text = person.email
                self?.dobLabel.text = person.dob
                self?.ageLabel.text = "\(person.age)"
            }
        }
        
        // Load person data
        loadPersonData()
    }
    
    func loadPersonData() {
        let person = Person(name: "Sridhar Muthineni", email: "sri@example.com", dob: "12-12-1999")
        let action = PersonAction.loadPerson(person)
        personStore.dispatch(action: action)
    }
}

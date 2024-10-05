//
//  PersonViewController.swift
//  FluxPattern
//
//  Created by Sridhar Muthineni on 03/10/2024.
//

import UIKit

class PersonViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register listener to update UI when store changes
        PersonStore.shared.addListener { person in
            guard let person = person else { return }
            self.nameLabel.text = person.name
            self.emailLabel.text = person.email
            self.dobLabel.text = person.dob
            self.ageLabel.text = "\(person.age)"
        }
        
        // Load person data via action
        loadPersonData()
    }
    
    func loadPersonData() {
        let person = Person(name: "Sridhar Muthineni", email: "sri@example.com", dob: "12-12-1999")
        let action = LoadPersonAction(person: person)
        Dispatcher.shared.dispatch(actionName: "LOAD_PERSON", action: action)
    }
}

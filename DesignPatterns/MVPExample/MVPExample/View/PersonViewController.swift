//
//  PersonViewController.swift
//  MVPExample
//
//  Created by Sridhar Muthineni on 14/09/2024.
//

import UIKit

class PersonViewController: UIViewController, PersonViewProtocol {
    
    // Outlet connections
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var presenter: PersonPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the presenter
        let person = fetchData()
        presenter = PersonPresenter(view: self, person: person)
        
        // Load the person data
        presenter?.loadPersonData()
    }
    
    // Mimics API call to fetch data
    func fetchData() -> Person {
        return Person(name: "Sridhar Muthineni", email: "sri@example.com", dob: "12-12-2000")
    }
    
    // PersonViewProtocol implementation to update UI
    func showPersonData(name: String, email: String, dob: String, age: String) {
        nameLabel.text = name
        emailLabel.text = email
        dobLabel.text = dob
        ageLabel.text = age
    }
}

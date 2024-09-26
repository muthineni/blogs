//
//  ViewController.swift
//  MVCExample
//
//  Created by Sridhar Muthineni on 10/09/2024.
//

import UIKit

class ViewController: UIViewController {
    // outlet connections
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // fetch data
        let person = fetchData()
        // populate data
        populateData(person: person)
    }
    
    func fetchData() -> Person {
        // Mimics api call to fetch data
        return Person(name: "Sridhar Muthineni", email: "sri@example.com", dob: "12-12-2000")
    }
    
    func populateData(person: Person) {
        nameLabel.text = person.name
        emailLabel.text = person.email
        dobLabel.text = person.dob
        ageLabel.text = "\(person.age)"
    }
}


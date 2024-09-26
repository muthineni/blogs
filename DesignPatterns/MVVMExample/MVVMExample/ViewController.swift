//
//  ViewController.swift
//  MVVMExample
//
//  Created by Sridhar Muthineni on 13/09/2024.
//

import UIKit

class ViewController: UIViewController {
    // outlet connections
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    // Declare the ViewModel
    var viewModel: PersonViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Fetch data and initialize the ViewModel
        let person = fetchData()
        viewModel = PersonViewModel(person: person)
        
        // Populate the UI using ViewModel
        populateData()
    }
    
    func fetchData() -> Person {
        // Mimics API call to fetch data
        return Person(name: "Sridhar Muthineni", email: "sri@example.com", dob: "12-12-2000")
    }
    
    func populateData() {
        // Safely unwrap the ViewModel and use its properties to populate the UI
        if let viewModel = viewModel {
            nameLabel.text = viewModel.displayName
            emailLabel.text = viewModel.displayEmail
            dobLabel.text = viewModel.displayDob
            ageLabel.text = viewModel.displayAge
        }
    }
}


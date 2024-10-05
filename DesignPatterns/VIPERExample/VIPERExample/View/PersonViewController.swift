//
//  PersonViewController.swift
//  VIPERExample
//
//  Created by Sridhar Muthineni on 13/09/2024.
//

import UIKit

class PersonViewController: UIViewController, PersonViewProtocol {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    var presenter: PersonPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    func showPersonInfo(name: String, email: String, dob: String, age: String) {
        nameLabel.text = name
        emailLabel.text = email
        dobLabel.text = dob
        ageLabel.text = age
    }
}

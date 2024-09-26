//
//  PersonViewProtocol.swift
//  MVPExample
//
//  Created by Sridhar Muthineni on 14/09/2024.
//

import Foundation

protocol PersonViewProtocol: AnyObject {
    func showPersonData(name: String, email: String, dob: String, age: String)
}

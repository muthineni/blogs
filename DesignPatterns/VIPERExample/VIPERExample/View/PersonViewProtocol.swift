//
//  PersonViewProtocol.swift
//  VIPERExample
//
//  Created by Sridhar Muthineni on 13/09/2024.
//

import Foundation

protocol PersonViewProtocol: AnyObject {
    func showPersonInfo(name: String, email: String, dob: String, age: String)
}

//
//  Person.swift
//  FluxPattern
//
//  Created by Sridhar Muthineni on 03/10/2024.
//

import Foundation

struct Person {
    var name: String
    var email: String
    var dob: String
    
    var age: Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        guard let date = dateFormatter.date(from: dob) else {
            return -1
        }
        
        let calendar = Calendar.current
        let currentDate = Date()
        
        let components = calendar.dateComponents([.year], from: date, to: currentDate)
        
        return components.year ?? -1
    }
}

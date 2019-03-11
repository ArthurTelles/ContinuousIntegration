//
//  Student.swift
//  ContinuousIntegrationProject
//
//  Created by Arthur Telles on 11/03/19.
//  Copyright © 2019 Arthur Telles. All rights reserved.
//

class Student
{
    // Variables
    let firstName: String
    let lastName: String
    
    // Inicialization
    init(firstName: String, lastName: String)
    {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func validFirstName() -> Bool { return firstName.count > 3 }
    func validLastName() -> Bool { return lastName.count > 3 }
}

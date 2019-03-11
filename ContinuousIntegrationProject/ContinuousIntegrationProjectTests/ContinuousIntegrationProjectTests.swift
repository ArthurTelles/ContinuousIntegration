//
//  ContinuousIntegrationProjectTests.swift
//  ContinuousIntegrationProjectTests
//
//  Created by Arthur Telles on 11/03/19.
//  Copyright © 2019 Arthur Telles. All rights reserved.
//

import XCTest
@testable import ContinuousIntegrationProject

class StudentClassTests: XCTestCase
{
    // Tests if the validFirstName function is working correctly
    func testValidFirstName()
    {
        let student = Student(firstName: "Kenshin", lastName: "Himura")
        XCTAssertTrue(student.validFirstName())
    }
    
    // Tests if the validLastName function is working correctly
    func testValidLastName()
    {
        let student = Student(firstName: "Yusuke", lastName: "Urameshi")
        XCTAssertTrue(student.validLastName())
    }
}


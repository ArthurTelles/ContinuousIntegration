//
//  ViewController.swift
//  ContinuousIntegrationProject
//
//  Created by Arthur Telles on 11/03/19.
//  Copyright © 2019 Arthur Telles. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    // Outlets
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var textFieldFirstName: UITextField!
    @IBOutlet weak var textFieldLastName: UITextField!
    
    // Variable used to storage the students info
    var studentsArray = [Student]()
    
    override func viewDidLoad() {super.viewDidLoad()}
    
    // Save button action
    @IBAction func saveButton(_ sender: Any)
    {
        // Auxiliar varible used to check the input name
        let auxStudent = Student(firstName: self.textFieldFirstName.text!, lastName: self.textFieldLastName.text!)
        
        // Input name verification
        if auxStudent.validFirstName() && auxStudent.validLastName()
        {
            self.studentsArray.append(auxStudent)
            self.statusLabel.text = "Student info saved"
            self.statusLabel.isHidden = false
            self.textFieldFirstName.text! = ""
            self.textFieldLastName.text! = ""
            
            print("\nName of the student saved\n")
        }
        else
        {
            if !auxStudent.validFirstName() {self.statusLabel.text = "Invalid first name length"}
            else {self.statusLabel.text = "Invalid last name length"}
            self.statusLabel.isHidden = false
            self.textFieldFirstName.text! = ""
            self.textFieldLastName.text! = ""
            print("\nThe first and last name must contain more than 3 letters\n")
        }
    }
}



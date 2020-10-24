//
//  AddStudentViewController.swift
//  TutorHelper
//
//  Created by Angelina on 24.10.2020.
//

import UIKit

protocol AddStudentViewControllerDelegate: class {
    func addStudent(name: String)
}

final class AddStudentViewController: UIViewController {
    
    weak var delegate: AddStudentViewControllerDelegate?
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addStudentButton: UIButton!
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        delegate?.addStudent(name: name)
        dismiss(animated: true)
    }
}

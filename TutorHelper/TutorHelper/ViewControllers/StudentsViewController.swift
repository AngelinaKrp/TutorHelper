//
//  StudentsViewController.swift
//  TutorHelper
//
//  Created by Angelina on 24.10.2020.
//

import UIKit
import CoreData

final class StudentsViewController: UITableViewController {
    
    // MARK: - Private properties
    
    let studentManager = StudentManager()
    private var students: [Student] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentManager.fetchStudents { [weak self] students in
            self?.students = students
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StudentCell.reusableID, for: indexPath) as! StudentCell
        if let name = students[indexPath.row].lastName {
            cell.configure(with: name)
        }
        return cell
    }
    
    // MARK: - Actions
    @IBAction func addStudentButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let addViewController = storyboard.instantiateViewController(identifier: "AddStudentViewController") as! AddStudentViewController
        addViewController.delegate = self
        present(addViewController, animated: true)
    }
}

extension StudentsViewController: AddStudentViewControllerDelegate {
    func addStudent(name: String) {
        studentManager.addStudent(name: name)
    }
}

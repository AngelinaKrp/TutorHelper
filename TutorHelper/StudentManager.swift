//
//  StudentManager.swift
//  TutorHelper
//
//  Created by Angelina on 24.10.2020.
//

import Foundation
import CoreData

final class StudentManager {
    private var coreDataStack = CoreDataStack()
    
    func fetchStudents(completion: @escaping ([Student]) -> Void) {
        let studentName: NSFetchRequest<Student> = Student.fetchRequest()
        
        do {
            let students = try coreDataStack.managedContext.fetch(studentName)
        } catch let error as NSError {
            print("\(error) , \(error.userInfo)")
        }
    }
    func addStudent(name: String) {
        let student = Student(context: coreDataStack.managedContext)
        student.lastName = name
        coreDataStack.saveContext()
    }
}

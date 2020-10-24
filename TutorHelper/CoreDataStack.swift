//
//  CoreDataStack.swift
//  TutorHelper
//
//  Created by Angelina on 24.10.2020.
//

import Foundation
import CoreData

class CoreDataStack {
  
    private let modelName = "TutorHelper"
  
    private lazy var storeContainer: NSPersistentContainer = {
      
      let container = NSPersistentContainer(name: modelName)
      container.loadPersistentStores {
        (storeDescription, error) in
        if let error = error as NSError? {
          print("Unresolved error \(error), \(error.userInfo)")
        }
      }
      return container
    }()
    
    lazy var managedContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
  
    func saveContext () {
        guard managedContext.hasChanges else { return }
    
        do {
            try managedContext.save()
        } catch let error as NSError {
            managedContext.rollback()
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
}

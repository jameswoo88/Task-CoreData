//
//  CoreDataStack.swift
//  Task-CoreData
//
//  Created by James Chun on 4/27/21.
//

import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Task_CoreData") //must match your project file name
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Error loading persisten stores: \(error), \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext { container.viewContext } //context is a part of the containter
    
    static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context: \(error), \(error.localizedDescription)")
            }
        }
    }
    
}//End of enum


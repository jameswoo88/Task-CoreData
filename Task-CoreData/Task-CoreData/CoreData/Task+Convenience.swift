//
//  Task+Convenience.swift
//  Task-CoreData
//
//  Created by James Chun on 4/27/21.
//

import CoreData

extension Task {
    //MARK: - Initializer
    @discardableResult convenience init(name: String, notes: String? = nil, dueDate: Date? = nil, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
    }
    
    //MARK: - Functions
    func add(taskWithName name: String, notes: String?, dueDate: Date?) {
        //let task = Task(name: name, notes: notes, dueDate: dueDate)
        
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        
    }
    
    func remove(task: Task) {
        
    }
    
    func fetchTasks() {
        
    }
    
}//End of extension

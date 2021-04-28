//
//  TaskController.swift
//  Task-CoreData
//
//  Created by James Chun on 4/27/21.
//

import CoreData

class TaskController {
    //MARK: - Properties
    static let sharedInstance = TaskController()
    
    var tasks: [Task] = []
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    //MARK: - Functions
    //CRUD
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let task = Task(name: name, notes: notes, dueDate: dueDate)
        tasks.append(task)
        
        CoreDataStack.saveContext()
    }
    
    func fetchDate() {
        let tasks = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print("# of tasks: \(tasks.count)")
        self.tasks = tasks
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?) {
        task.name = name
        task.notes = notes
        task.dueDate = dueDate
        
        CoreDataStack.saveContext()
    }
    
    func delete(task: Task) {
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks.remove(at: index)
        
        CoreDataStack.context.delete(task)
        CoreDataStack.saveContext()
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        
        CoreDataStack.saveContext()
    }
    
}//End of class

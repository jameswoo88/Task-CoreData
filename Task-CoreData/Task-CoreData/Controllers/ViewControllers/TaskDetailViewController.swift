//
//  TaskDetailTableViewController.swift
//  Task-CoreData
//
//  Created by James Chun on 4/27/21.
//

import UIKit
import UserNotifications

class TaskDetailViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDatePicker: UIDatePicker!
    
    //MARK: - Properties
    //Landing Pad
    var task: Task?
    var date: Date?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = taskNameTextField.text, !name.isEmpty,
              let notes = taskNotesTextView.text, !name.isEmpty else { return }

        if let task = task {
            task.name = name
            task.notes = notes
            TaskController.sharedInstance.update(task: task, name: name, notes: notes, dueDate: taskDatePicker.date)
        } else {
            TaskController.sharedInstance.createTaskWith(name: name, notes: notes, dueDate: taskDatePicker.date)
        }
                
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        date = taskDatePicker.date
    }
    
    //MARK: - Functions
    func updateViews() {
        guard let task = task else { return }
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
        taskDatePicker.date = task.dueDate ?? Date()
    }
    
}//End of class

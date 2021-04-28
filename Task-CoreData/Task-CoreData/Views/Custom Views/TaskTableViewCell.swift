//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by James Chun on 4/27/21.
//

import UIKit

//MARK: - Protocol
protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskDueDateLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    //MARK: - Properties
    weak var delegate: TaskCompletionDelegate?

    var task: Task? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Actions
    @IBAction func completionButtonTapped(_ sender: Any) {
        guard let delegate = delegate else { return }
        delegate.taskCellButtonTapped(self)
    }
    
    //MARK: - Function
    func updateViews() {
        guard let task = task,
              let dueDate = task.dueDate else { return }
        taskNameLabel.text = task.name
        taskDueDateLabel.text = "Due date: \(dueDate.formatToString())"
        let image = task.isComplete ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
        completionButton.setImage(image, for: .normal)
    }
    
}

//
//  TaskListTableViewController.swift
//  Task-CoreData
//
//  Created by James Chun on 4/27/21.
//

import UIKit


class TaskListTableViewController: UITableViewController {

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TaskController.sharedInstance.fetchDate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskController.sharedInstance.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as? TaskTableViewCell else { return UITableViewCell() }
        
        let task = TaskController.sharedInstance.tasks[indexPath.row]
        
        cell.delegate = self
        cell.task = task
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.sharedInstance.tasks[indexPath.row]
            TaskController.sharedInstance.delete(task: task)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //IIDOO
        if segue.identifier == "toEditTask" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destinationVC = segue.destination as? TaskDetailViewController else { return }
            
            let taskToSend = TaskController.sharedInstance.tasks[indexPath.row]
            destinationVC.task = taskToSend
        }
    }

}//End of class

//MARK: - Extensions
extension TaskListTableViewController: TaskCompletionDelegate {
    func taskCellButtonTapped(_ sender: TaskTableViewCell) {
        guard let task = sender.task else { return }
        
        TaskController.sharedInstance.toggleIsComplete(task: task)
        sender.updateViews()
    }
    
}//End of extension

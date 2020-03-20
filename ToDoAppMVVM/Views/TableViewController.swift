//
//  ViewController.swift
//  ToDoAppMVVM
//
//  Created by Никита Гундорин on 20.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController, AddTaskDelegate, ToDoTaskDelegate {
    var viewModel: ToDoTaskListViewModel = ToDoTaskListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == viewModel.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addTaskCell", for: indexPath) as! AddToDoTaskTableViewCell
            cell.delegate = self
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoTaskTableViewCell
        cell.delegate = self
        cell.viewModel = self.viewModel.cellViewModel(forIndexPath: indexPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if (indexPath.row == viewModel.count){
            return UITableViewCell.EditingStyle.none
        } else {
            return UITableViewCell.EditingStyle.delete
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            self.viewModel.removeTask(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func addToDoTask(toDoTaskTitle: String) {
        ToDoTaskListViewModel.createTask(title: toDoTaskTitle)
        tableView.reloadData()
    }
    
    func toggleTaskCompleted(cell: ToDoTaskTableViewCell) {
        self.viewModel.toggleTaskCompleted(forIndexPath: self.tableView.indexPath(for: cell))
        tableView.reloadData()
    }
}


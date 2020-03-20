//
//  ViewController.swift
//  ToDoAppMVC
//
//  Created by Никита Гундорин on 20.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController, AddTaskDelegate, ToDoTaskDelegate {
    var items: Results<ToDoTask>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        items = Persistance.shared.getTasks()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if items.count != 0 {
            return items.count + 1
        }
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == items.count) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addTaskCell", for: indexPath) as! AddToDoTaskTableViewCell
            
            cell.delegate = self
            
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ToDoTaskTableViewCell
        cell.delegate = self
        let item = items[indexPath.row]
        
        cell.label.text = item.title
        cell.checkbox.isChecked = item.isCompleted

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if (indexPath.row == items.count){
            return UITableViewCell.EditingStyle.none
        } else {
            return UITableViewCell.EditingStyle.delete
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            Persistance.shared.removeTask(toDoTask: items[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func addToDoTask(toDoTaskTitle: String) {
        Persistance.shared.createTask(title: toDoTaskTitle)
        tableView.reloadData()
    }
    
    func toggleTaskCompleted(cell: ToDoTaskTableViewCell) {
        guard let index = self.tableView.indexPath(for: cell)?.row,
            let item = self.items?[index] else { return }
        Persistance.shared.toggleTaskCompleted(toDoTask: item)
        tableView.reloadData()
    }
}


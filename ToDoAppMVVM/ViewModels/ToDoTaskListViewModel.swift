//
//  ToDoTaskViewModel.swift
//  ToDoAppMVVM
//
//  Created by Никита Гундорин on 20.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import Foundation
import RealmSwift

class ToDoTaskListViewModel {
    var tasks: Results<ToDoTask>!
    
    var numberOfRows: Int { get {
            if self.tasks.count != 0 {
                return self.tasks.count + 1
            }
            return 1
        }
    }
    
    var count: Int { get { return self.tasks.count } }
    
    init() {
        self.tasks = Persistance.shared.getTasks()
    }
    
    func cellViewModel(forIndexPath: IndexPath) -> ToDoTaskViewModel? {
        guard let task = self.tasks?[forIndexPath.row] else { return nil }
        return ToDoTaskViewModel(task: task)
    }
    
    func removeTask(indexPath: IndexPath) {
        Persistance.shared.removeTask(toDoTask: self.tasks[indexPath.row])
    }
    
    func toggleTaskCompleted(forIndexPath: IndexPath?) {
        guard let index = forIndexPath?.row,
            let item = self.tasks?[index] else { return }
        Persistance.shared.toggleTaskCompleted(toDoTask: item)
    }
    
    static func createTask(title: String) {
        Persistance.shared.createTask(title: title)
    }
}

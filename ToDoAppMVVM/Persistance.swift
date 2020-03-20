//
//  Persistance.swift
//  ToDoAppMVVM
//
//  Created by Никита Гундорин on 20.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import Foundation
import RealmSwift


class Persistance {
    static let shared = Persistance()
    
    let realm = try! Realm()
    
    func getTasks() -> Results<ToDoTask> {
        realm.objects(ToDoTask.self).sorted(byKeyPath: "isCompleted", ascending: true)
    }
    
    func createTask(title: String) {
        let toDoTask = ToDoTask()
        toDoTask.title = title
        
        try! realm.write {
            realm.add(toDoTask)
        }
    }
    
    func removeTask(toDoTask: ToDoTask) {
        try! realm.write {
            realm.delete(toDoTask)
        }
    }
    
    func toggleTaskCompleted(toDoTask: ToDoTask) {
        try! realm.write {
            toDoTask.isCompleted = !toDoTask.isCompleted
        }
    }
}

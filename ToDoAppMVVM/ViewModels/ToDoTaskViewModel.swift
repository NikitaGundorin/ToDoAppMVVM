//
//  ToDoTaskViewModel.swift
//  ToDoAppMVVM
//
//  Created by Никита Гундорин on 20.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import Foundation

class ToDoTaskViewModel {
    var title: String = ""
    var isCompleted: Bool = false
    
    init(task: ToDoTask) {
        self.title = task.title
        self.isCompleted = task.isCompleted
    }
}

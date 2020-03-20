//
//  AddToDoTaskTableViewCell.swift
//  ToDoAppMVVM
//
//  Created by Никита Гундорин on 20.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import UIKit

protocol AddTaskDelegate {
    func addToDoTask(toDoTaskTitle: String)
}

class AddToDoTaskTableViewCell: UITableViewCell {

    var delegate: AddTaskDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func primaryActionTriggered(_ sender: Any) {
        if (textField.text != nil && textField.text != "") {
            delegate?.addToDoTask(toDoTaskTitle: textField.text!)
            textField.text = nil
        }
        textField.resignFirstResponder()
    }
    
}

//
//  ToDoTaskTableViewCell.swift
//  ToDoAppMVC
//
//  Created by Никита Гундорин on 20.03.2020.
//  Copyright © 2020 Никита Гундорин. All rights reserved.
//

import UIKit

protocol ToDoTaskDelegate {
    func toggleTaskCompleted(cell: ToDoTaskTableViewCell)
}

class ToDoTaskTableViewCell: UITableViewCell {

    var delegate: ToDoTaskDelegate?
    
    @IBOutlet weak var checkbox: ToDoCheckbox!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func checkboxTouched(_ sender: Any) {
        delegate?.toggleTaskCompleted(cell: self)
        checkbox.isChecked = !checkbox.isChecked
    }
}

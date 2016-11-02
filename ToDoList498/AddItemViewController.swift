//
//  AddItemViewController.swift
//  ToDoList498
//
//  Created by Sam Bender on 10/20/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var taskTitle: UITextField!
    @IBOutlet weak var taskDescription: UITextView!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.addButton.layer.borderWidth = 5.0
        self.addButton.layer.borderColor = UIColor.green.cgColor
        self.addButton.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addItem(_ sender: AnyObject) {
        let tasks = Tasks.shared
        tasks.add(task: Task(title: self.taskTitle.text!, taskDescription: self.taskDescription.text))
        self.dismiss(animated: true, completion: nil)
    }
}

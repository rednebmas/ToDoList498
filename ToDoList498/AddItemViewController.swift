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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addItem(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        var tasks = defaults.array(forKey: "tasks")
        if tasks == nil {
            tasks = Array()
        }
        tasks!.append([
            "title" : self.taskTitle.text!,
            "description" : self.taskDescription.text!
        ])
        defaults.set(tasks, forKey: "tasks")
        self.dismiss(animated: true, completion: nil)
    }
}

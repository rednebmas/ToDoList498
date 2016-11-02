//
//  Tasks.swift
//  ToDoList498
//
//  Created by Sam Bender on 11/1/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class Tasks: NSObject {
    static let shared = Tasks()
    private (set) var list: [Task] = Array()
    // a file named tasks in the documents directory
    private static let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] + "tasks"
    
    override init() {
        super.init()
        loadFromFile()
    }
    
    func loadFromFile() {
        let list = NSKeyedUnarchiver.unarchiveObject(withFile: Tasks.filePath) as? [Task]
        if list != nil {
            self.list = list!
        }
    }
    
    func add(task: Task) {
        list.append(task)
        NSKeyedArchiver.archiveRootObject(self.list, toFile: Tasks.filePath)
    }
    
    func remove(at: Int) {
        list.remove(at: at)
        NSKeyedArchiver.archiveRootObject(self.list, toFile: Tasks.filePath)
    }
}

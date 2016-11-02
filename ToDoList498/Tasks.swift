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
    private static let filePath = "tasks"
    
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

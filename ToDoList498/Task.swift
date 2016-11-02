//
//  Task.swift
//  ToDoList498
//
//  Created by Sam Bender on 11/1/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class Task: NSObject, NSCoding {

    var title: String
    var taskDescription: String?
    
    // MARK: NSCoding
    
    init(title: String, taskDescription: String?) {
        self.title = title
        self.taskDescription = taskDescription
    }
    
    required convenience init?(coder decoder: NSCoder) {
        guard let title = decoder.decodeObject(forKey: "title") as? String,
              let taskDescription = decoder.decodeObject(forKey: "taskDescription") as? String?
                  else { return nil }
        
        self.init(
            title: title,
            taskDescription: taskDescription
        )
    }
    
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.taskDescription, forKey: "taskDescription")
    }
}

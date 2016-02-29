//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Jessie Albarian on 2/23/16.
//  Copyright © 2016 babyllama. All rights reserved.
//

import Foundation

class TodoItem {
    var name : String
    var reminderDate : NSDate
    var id : String
    
    init(newName: String, newReminderDate: NSDate, newId: String){
        self.name = newName
        self.reminderDate = newReminderDate
        id = newId
    }
    func overDue()->Bool {
        return (NSDate().compare(self.reminderDate) == NSComparisonResult.OrderedDescending)
    }
}


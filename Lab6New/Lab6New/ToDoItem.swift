//
//  ToDoItem.swift
//  Lab6New
//
//  Created by Jessie Albarian on 3/17/16.
//  Copyright © 2016 jessie. All rights reserved.
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
        // reminder date is earlier than current date
        return (NSDate().compare(self.reminderDate) == NSComparisonResult.OrderedDescending)
    }
}
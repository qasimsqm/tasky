/*
 TaskManager.swift
 Tasky
 Created by Syed Qasim on 4/4/17.
 Copyright © 2017 Origamistudio. All rights reserved.
*/

import UIKit

var taskMgr: TaskManager = TaskManager()

struct Task {
    var name = "Name"
    var description = "Description"
}

class TaskManager: NSObject {
    
    var tasks = [Task]()
    var persistenceHelper: PersistenceHelper = PersistenceHelper()
    
    override init(){
        
        let tempTasks:NSArray = persistenceHelper.list("Task")
        for res:AnyObject in tempTasks as [AnyObject]{
            tasks.append(Task(name:res.value(forKey: "name")as! String,description:res.value(forKey: "desc") as! String))
        }
    }
    
    
    func addTask(_ name:String, desc: String){
        
        var dicTask: Dictionary<String, String> = Dictionary<String,String>()
        dicTask["name"] = name
        dicTask["desc"] = desc
        
        if(persistenceHelper.save("Task", parameters: dicTask)){
            tasks.append(Task(name: name, description:desc))
        }
    }
    
    func removeTask(_ index:Int){
        
        let value:String = tasks[index].name
        
        if(persistenceHelper.remove("Task", key: "name", value: value)){
            tasks.remove(at: index)
        }
    }

    
}

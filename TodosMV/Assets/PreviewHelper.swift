//
//  PreviewHelper.swift
//  TodosMV
//
//  Created by Julien Onorato on 03/11/2024.
//

// Preview helper called from #Preview, compiled only for local development.


import Foundation

#if DEBUG
struct PreviewHelper {
    static func getOneUncompletedTask() -> Task {
        let task = Task(title: "Task 1", dueDate: Date(), isCompleted: false)
        return task
    }
    
    static func getOneCompletedTask() -> Task {
        let task = Task(title: "Task 1", dueDate: Date(), isCompleted: true)
        return task
    }
    
    static func getMultipleTasks() -> [Task] {
        let tasks = [
            Task(title: "Task 1", dueDate: Date(), isCompleted: false),
            Task(title: "Task 2", dueDate: Date(), isCompleted: true),
            Task(title: "Task 3", dueDate: Date(), isCompleted: false),
        ]
        return tasks
    }
    
    static func getOneTitle() -> String {
        "Courir"
    }
}
#endif

//
//  Task.swift
//  TodosMV
//
//  Created by Julien Onorato on 01/11/2024.
//
import Foundation
import SwiftData

@Model
class Task {
    var title: String
    var dueDate: Date
    var isCompleted: Bool
    
    init(title: String, dueDate: Date, isCompleted: Bool) {
        self.title = title
        self.dueDate = dueDate
        self.isCompleted = isCompleted
    }
}

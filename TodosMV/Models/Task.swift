//
//  Task.swift
//  TodosMV
//
//  Created by Julien Onorato on 01/11/2024.
//
import Foundation

struct Task: Identifiable, Codable {
    let id: UUID
    var title: String
    var dueDate: Date
    var isCompleted: Bool
}

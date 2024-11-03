//
//  TaskService.swift
//  TodosMV
//
//  Created by Julien Onorato on 01/11/2024.
//

import Foundation
import Combine

class TaskService {
    static let shared = TaskService()
    private let networkManager = NetworkManager()
    
    func getTasks() -> AnyPublisher<[Task], Error> {
        return networkManager.get(endpoint: "/tasks")
            .decode(type: [Task].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func createTask(_ task: Task) -> AnyPublisher<Task, Error> {
        return networkManager.post(endpoint: "/tasks", body: task)
            .decode(type: Task.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

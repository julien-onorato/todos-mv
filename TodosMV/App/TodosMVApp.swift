//
//  TodosMVApp.swift
//  TodosMV
//
//  Created by Julien Onorato on 01/11/2024.
//

import SwiftUI
import SwiftData

@main
struct TodosMVApp: App {
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: Task.self)
        } catch {
            fatalError("Failed to create ModelContainer for Task")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            TasksListView()
        }
        .modelContainer(container)
    }
}

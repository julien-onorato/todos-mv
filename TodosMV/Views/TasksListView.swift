//
//  TasksListView.swift
//  TodosMV
//
//  Created by Julien Onorato on 03/11/2024.
//

import SwiftUI
import SwiftData
import Combine

struct TasksListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]
    @State private var isAddingNew = false
    @State private var newTaskTitle: String = ""
    @State private var showingAlert: Bool = false
    
    private var taskTitleMatchRequirements: Bool {
        newTaskTitle.count >= 3
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sortedTasks) { task in
                    TaskView(task: task)
                        .transition(.move(edge: .top))
                }
                .onDelete(perform: deleteTasks)
            }
            .animation(.easeInOut(duration: 0.3), value: sortedTasks)
            .navigationTitle("Tâches")
            .toolbar {
                Button("Ajouter") {
                    showingAlert = true
                }
            }
            .sheet(isPresented: $isAddingNew) {
                AddTaskView(title: newTaskTitle)
                    .presentationDetents([.medium])
                    .interactiveDismissDisabled()
            }
            .alert("Entrer un titre", isPresented: $showingAlert) {
                TextField("Finir exercice, Courir...", text: $newTaskTitle)
                Button("OK") {
                    isAddingNew = true
                }
                .disabled(!taskTitleMatchRequirements)
                Button("Annuler", role: .cancel) {}
                
            }
        }
    }
    
    private var sortedTasks: [Task] {
        tasks.sorted { lhs, rhs in
            if lhs.isCompleted == rhs.isCompleted {
                return lhs.dueDate < rhs.dueDate
            }
            return !lhs.isCompleted && rhs.isCompleted
        }
    }
    
    private func deleteTasks(_ indexSet: IndexSet) {
        for index in indexSet {
            modelContext.delete(tasks[index])
        }
    }
}

#Preview {
    TasksListView()
}

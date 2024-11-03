//
//  AddTaskView.swift
//  TodosMV
//
//  Created by Julien Onorato on 03/11/2024.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    let title: String
    @State private var dueDate: Date = Date()
    @State private var isCompleted: Bool = false
    
    private var matchRequirements: Bool {
        title.count >= 3 &&
        title.count <= 20 &&
        dueDate >= Calendar.current.startOfDay(for: Date())
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker("Date limite...", selection: $dueDate, displayedComponents: .date)
                    .datePickerStyle(.graphical)
            
            }
            .navigationTitle("Date limite")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color.red)
                    }
                    
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        addTask(
                            Task(title: title, dueDate: dueDate, isCompleted: false)
                        )
                    } label: {
                        Image(systemName: "checkmark")
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 2.0)
                                    .scale(matchRequirements ? 1.5 : 0.0)
                                    .opacity(matchRequirements ? 1 : 0)
                                    .animation(.easeInOut(duration: 0.3), value: matchRequirements)
                            )
                            .foregroundStyle(matchRequirements ? Color.green : Color.gray)
                    }
                    .disabled(!matchRequirements)
                }
            }
        }
    }
    
    private func addTask(_ task: Task) {
        modelContext.insert(task)
        try? modelContext.save()
        dismiss()
    }
}

#Preview {
    AddTaskView(title: PreviewHelper.getOneTitle())
}

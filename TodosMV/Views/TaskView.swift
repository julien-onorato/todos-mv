//
//  TaskView.swift
//  TodosMV
//
//  Created by Julien Onorato on 03/11/2024.
//

import SwiftUI

struct TaskView: View {
    @State var task: Task
    
    var body: some View {
        HStack {
            Toggle(isOn: .init(
                get: { task.isCompleted },
                set: { task.isCompleted = $0 }
            )) {
                VStack(alignment: .leading) {
                    Text(task.title)
                    Text(task.dueDate, style: .date)
                        .font(.caption)
                }
            }
        }
    }
}

#Preview {
    TaskView(task: PreviewHelper.getOneCompletedTask())
}

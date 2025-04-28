//
//  AddAssignmentView.swift
//  AssignmentNotebook May
//
//  Created by Samuel Amante on 4/27/25.
//

import SwiftUI

struct AddAssignmentView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var assignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Course", text: $course)
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationTitle("New Assignment")
            .navigationBarItems(trailing: Button("Save") {
                let newAssignment = Assignment(course: course, description: description, dueDate: dueDate)
                assignmentList.assignments.append(newAssignment)
                presentationMode.wrappedValue.dismiss()
            })
        }

    }
}

#Preview {
    AddAssignmentView()
}

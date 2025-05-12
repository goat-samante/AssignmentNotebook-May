//
//  ContentView.swift
//  AssignmentNotebook May
//
//  Created by Samuel Amante on 4/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var assignments = [
        Assignment(course: "Math", description: "Chapter 5 Problems", dueDate: Date()),
        Assignment(course: "History", description: "Essay on Civil War", dueDate: Date()),
        Assignment(course: "Science", description: "Build a Volcano", dueDate: Date())
    ]
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignment = false

    var body: some View {
        NavigationView {
            ForEach(assignments) { assignment in
                VStack(alignment: .leading) {
                    Text(assignment.course)
                        .font(.headline)
                    Text(assignment.description)
                        .font(.subheadline)
                    Text(assignment.dueDate, style: .date)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Assignments")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                showingAddAssignment = true
            }) {
                Image(systemName: "plus")
            })
        }
        .sheet(isPresented: $showingAddAssignment) {
            AddAssignmentView(assignmentList: assignmentList)
        }
    }
}

#Preview {
    ContentView()
}

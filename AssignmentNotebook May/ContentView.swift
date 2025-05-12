//
//  ContentView.swift
//  AssignmentNotebook May
//
//  Created by Samuel Amante on 4/27/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddAssignment = false

    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentList.assignments) { assignment in
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
                .onMove { indices, newOffset in
                    assignmentList.assignments.move(fromOffsets: indices, toOffset: newOffset)
                }
                .onDelete { indexSet in
                    assignmentList.assignments.remove(atOffsets: indexSet)
                }
            }
            .navigationTitle("Assignments")
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    showingAddAssignment = true
                }, label: {
                    Image(systemName: "plus")
                })
            )
        }
        .sheet(isPresented: $showingAddAssignment) {
            AddAssignmentView(assignmentList: assignmentList)
        }
    }
}

#Preview {
    ContentView()
}

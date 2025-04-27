//
//  ContentView.swift
//  AssignmentNotebook May
//
//  Created by Samuel Amante on 4/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var assignments = ["Math Homework", "Science Project", "History Essay"]
    var body: some View {
        NavigationView {
            List(assignments, id: \.self) { assignment in
               Text(assignment)
            }
            .onMove { indices, newOffset in
                    assignments.move(fromOffsets: indices, toOffset: newOffset)
                }
            .onDelete { indexSet in
                assignments.remove(atOffsets: indexSet)
            }
            .navigationTitle("Assignments")
            .navigationBarItems(trailing: EditButton())
        }
    }
}

#Preview {
    ContentView()
}

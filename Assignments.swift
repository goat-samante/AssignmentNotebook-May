//
//  Assignments.swift
//  AssignmentNotebook May
//
//  Created by Samuel Amante on 4/27/25.
//

import Foundation

struct Assignment: Identifiable, Codable {
    var id = UUID()
    var course: String
    var description: String
    var dueDate: Date
}

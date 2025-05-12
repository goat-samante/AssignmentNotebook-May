//
//  AssignmentList.swift
//  AssignmentNotebook May
//
//  Created by Samuel Amante on 4/27/25.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var assignments = [Assignment]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(assignments) {
                UserDefaults.standard.set(encoded, forKey: "Assignments")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "Assignments") {
            if let decoded = try? JSONDecoder().decode([Assignment].self, from: data) {
                assignments = decoded
            }
        }
    }
}


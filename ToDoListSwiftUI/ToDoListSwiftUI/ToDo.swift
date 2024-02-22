//
//  ToDo.swift
//  ToDoListSwiftUI
//
//  Created by Alfredo Altube on 19/02/2024.
//

import Foundation

struct ToDo: Identifiable, Codable {
    var id: String?
    var item = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)
    var notes = ""
    var isCompleted = false
}

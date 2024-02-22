//
//  ToDoListSwiftUIApp.swift
//  ToDoListSwiftUI
//
//  Created by Alfredo Altube on 19/02/2024.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var toDosVM = ToDosViewModel()
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)
        }
    }
}

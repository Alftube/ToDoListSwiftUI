//
//  ToDoListView.swift
//  ToDoListSwiftUI
//
//  Created by Alfredo Altube on 20/02/2024.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPresented = false
    @EnvironmentObject var toDosVM: ToDosViewModel
    @State private var colorScheme: ColorScheme = .light

    var body: some View {
        NavigationStack {
            List {
                ForEach(toDosVM.toDos) { toDo in
                    HStack {
                        Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                toDosVM.toggleCompleted(toDo: toDo)
                            }

                        NavigationLink {
                            DetailView(toDo: toDo, colorScheme: $colorScheme)
                        } label: {
                            Text(toDo.item)
                        }
                    }
                    .font(.title2)
                }
                .onDelete(perform: toDosVM.deleteToDo)
                .onMove(perform: toDosVM.moveToDo)
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        toggleColorScheme()
                    }) {
                        Image(systemName: colorScheme == .light ? "moon.circle" : "sun.max.circle")
                            .imageScale(.large)
                    }
                }
            }
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: ToDo(), colorScheme: $colorScheme)
                }
            }
        }
        .preferredColorScheme(colorScheme)
    }

    private func toggleColorScheme() {
        colorScheme = (colorScheme == .light) ? .dark : .light
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
            .environmentObject(ToDosViewModel())
    }
}

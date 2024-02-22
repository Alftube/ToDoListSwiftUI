//
//  DetailView.swift
//  ToDoListSwiftUI
//
//  Created by Alfredo Altube on 20/02/2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var toDosVM: ToDosViewModel
    @State var toDo: ToDo
    @Binding var colorScheme: ColorScheme // Nuevo binding para el modo de color

    var body: some View {
        List {
            // Contenido de la lista aquí
        }
        .preferredColorScheme(colorScheme) // Aplica el modo de color seleccionado
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    toDosVM.saveToDo(toDo: toDo)
                    dismiss()
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DetailView(toDo: ToDo(), colorScheme: .constant(.light))
                .environmentObject(ToDosViewModel())
        }
    }
}

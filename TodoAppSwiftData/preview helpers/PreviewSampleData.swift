//
//  PreviewSampleData.swift
//  TodoAppSwiftData
//
//  Created by Volkan Celik on 11/08/2023.
//

import SwiftUI
import SwiftData

let previewContainer:ModelContainer={
    do{
        let container=try ModelContainer(for: Todo.self, ModelConfiguration(inMemory: true))
        Task{@MainActor in
            let context=container.mainContext
            let todo=Todo.example()
            context.insert(todo)
            let doneTodo=Todo(name: "Go to the dentist", isDone: true)
            context.insert(doneTodo)
            
        }
        return container
    }
    catch{
        fatalError("Failed to create container with error: \(error.localizedDescription)")
    }

}()

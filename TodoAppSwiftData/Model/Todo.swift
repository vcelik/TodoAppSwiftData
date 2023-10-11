//
//  Item.swift
//  TodoAppSwiftData
//
//  Created by Volkan Celik on 11/08/2023.
//

import SwiftUI
import SwiftData

@Model
final class Todo {
    @Attribute(.unique)
    var creationDate: Date
    var name:String
    var isDone:Bool
    var priority:Int
    
    @Attribute(.externalStorage)
    var image:Data?
    
    var tags:[Tag]?
    
    init(name:String,isDone:Bool=false,priority:Int=0) {
        self.creationDate = Date()
        self.name=name
        self.isDone=isDone
        self.priority=priority
    }
    
    static func example()->Todo{
        let todo=Todo(name: "Buy milk")
        let tag=Tag(name: "Shopping", color: RGBColor(red: 1, green: 0, blue: 0))
        todo.tags?.append(tag)
        return todo
    }
}





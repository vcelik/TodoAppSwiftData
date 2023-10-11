//
//  Tag.swift
//  TodoAppSwiftData
//
//  Created by Volkan Celik on 11/08/2023.
//

import SwiftUI
import SwiftData

@Model
class Tag{
    var name:String
    
    var todos:[Todo]?
    var color:RGBColor
    
    init(name: String,color:RGBColor) {
        self.name = name
        self.color=color
    }
}

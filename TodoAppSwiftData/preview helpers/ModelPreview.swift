//
//  ModelPreview.swift
//  TodoAppSwiftData
//
//  Created by Volkan Celik on 11/08/2023.
//

import SwiftUI
import SwiftData

struct ModelPreview<Model:PersistentModel,Content:View>: View {
    
    var content:(Model)->Content
    
    init(@ViewBuilder content: @escaping (Model) -> Content) {
        self.content = content
    }

    var body: some View {
        PreviewContentView(content: content)
            .modelContainer(previewContainer)
    }
    
    struct PreviewContentView:View {
        @Query private var models:[Model]
        @State private var waitedToShowIssue=false
        var content:(Model)->Content
        var body: some View {
            if let model=models.first{
                content(model)
            }else{
                ContentUnavailableView("Could not load model for previews", systemImage: "xmark")
                    .opacity(waitedToShowIssue ? 1 : 0)
                    .task {
                        Task{
                            try await Task.sleep(for: .seconds(1))
                            waitedToShowIssue=true
                        }
                    }
            }
        }
    }
}



//
//  LLMChatViewExtension.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 20.05.26.
//

import SwiftUI

extension LLMChatView {
    func messageBoxes() -> some View {
        ForEach(llmChatVM.llmChatHistory, id: \.self) { message in
            if message["role"] == "user" {
                if let userMessage = message["content"] {
                    MessageView(message: userMessage, color: .customBlue, alignment: .trailing)
                }
            } else {
                if let llmMessage = message["content"] {
                    MessageView(message: llmMessage, color: .white, alignment: .leading)
                    
                }
            }
        }
    }
}

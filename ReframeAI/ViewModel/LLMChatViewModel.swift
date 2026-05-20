//
//  LLMChatViewModel.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 17.05.26.
//

import Foundation
import Combine


class LLMChatViewModel: ObservableObject {
    @Published var llmLastResponse: String = ""
    @Published var llmChatHistory: [ [String: String] ] = []
    private let networkManager = NetworkManager()
    
    func fetchResponse(userMessage: String) async throws {
        do {
            if let choice = try await networkManager.setupRequest(userMessage: userMessage, message: llmChatHistory) {
                llmChatHistory.append(["role" : "user", "content" : userMessage])
                llmChatHistory.append(["role" : "assistant", "content" : choice.message.content])
                llmLastResponse = choice.message.content
            }
        } catch {
            throw error
        }   
    }
}

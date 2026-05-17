//
//  LLMChatViewModel.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 17.05.26.
//

import Foundation
import Combine

class LLMChatViewModel: ObservableObject {
    @Published var llmResponse = ""
    
    private let networkManager = NetworkManager()
    
    func fetchResponse(userMessage: String) async {
        if let choice = try? await networkManager.setupRequest(userMessage: userMessage) {
            llmResponse = choice.message.content
        }
    }
    
}

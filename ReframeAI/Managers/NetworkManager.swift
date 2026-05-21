//
//  NetworkManager.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 17.05.26.
//

import Foundation

class NetworkManager {
    func setupRequest(userMessage: String, message: [ [String: String] ]) async throws -> LLMChoice? {
        guard let url = URL(string: "https://openrouter.ai/api/v1/chat/completions") else {
            throw URLError(.badURL)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(Secret.openRouterAPIKey)", forHTTPHeaderField: "Authorization")
        
        var m = message
        m.insert(["role" : "system", "content" : String().llmInstruction], at: 0)
        m.append(["role": "user","content": "\(userMessage)"])
        
        let body: [String: Any] = [
            "model": "openai/gpt-5.2",
            "max_tokens": 500,
            "messages": m]
        
        
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        
        do {
            let decodedData = try JSONDecoder().decode(LLMResponse.self, from: data)
            return decodedData.choices.first
            
        } catch {
            throw error
        }
        
        
    }
}

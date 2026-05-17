//
//  Response.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 17.05.26.
//

import Foundation

struct LLMResponse: Decodable {
    let choices: [LLMChoice]
}

struct LLMChoice: Decodable {
    let message: LLMMessage
}

struct LLMMessage: Decodable {
    let content: String
    let refusal: String?
    let reasoning: String?
}

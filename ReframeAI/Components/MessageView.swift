//
//  MessageView.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 19.05.26.
//

import SwiftUI

struct MessageView: View {
    let message: String
    let color: Color
    let alignment: Alignment
    var body: some View {
        Text(.init(message))
            .multilineTextAlignment(.leading)
            .textSelection(.enabled)
            .padding()
            .foregroundStyle(color == .white ? .black : .white)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(maxWidth: .infinity, alignment: alignment)
            .shadow(radius: 10)
        
    }
}

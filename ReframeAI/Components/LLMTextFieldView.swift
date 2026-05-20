//
//  LLMTextFieldView.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 19.05.26.
//

import SwiftUI

struct LLMTextFieldView: View {
    let placeholder: String
    @Binding var textFieldText: String
    @FocusState.Binding var isFieldFocused: Bool
    var body: some View {
        TextField(placeholder, text: $textFieldText, axis: .vertical)
            .focused($isFieldFocused)
            .padding()
            .frame(height: 60)
            .background(RoundedRectangle(cornerRadius: 18).fill(.ultraThinMaterial))
            .foregroundColor(.black)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .lineLimit(50)
         
    }
}


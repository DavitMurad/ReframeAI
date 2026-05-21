//
//  LLMChatViewExtension.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 20.05.26.
//

import SwiftUI
import DotLottie

extension LLMChatView {
    func messageBoxes() -> some View {
        ForEach(llmChatVM.llmChatHistory, id: \.self) { message in
            if message["role"] == "user" {
                if let userMessage = message["content"] {
                    MessageView(message: userMessage, color: .customBlue, alignment: .trailing)
                }
            } else if message["role"] == "assistant" {
                if let llmMessage = message["content"] {
                    MessageView(message: llmMessage, color: .white, alignment: .leading)
                    
                }
            } else if message["role"] == "error" {
                if let errorMessage = message["content"] {
                    MessageView(message: errorMessage, color: .red, alignment: .leading)
                }
            }
        }
    }
    
    func setupChatView() -> some View {
        ScrollView {
            ScrollViewReader { proxy in
                VStack {
                    if llmChatVM.llmChatHistory.isEmpty {
                        MessageView(message: "Temproray Chat, nothing will be recorded", color: .white, alignment: .center)
                            .font(.subheadline)
                            .padding()
                        
                    }
                    messageBoxes()
                        .padding(.horizontal)
                        .padding(.bottom, 15)
                }
                .id(0)
                .onChange(of: llmChatVM.llmChatHistory.count) { _, _ in
                    withAnimation(.easeInOut) {
                        proxy.scrollTo(0, anchor: .bottom)
                    }
                }
            }
        }
        
        .contentShape(Rectangle())
        .onTapGesture {
            isTextFieldFocused = false
        }
    }
    
    func setupTextFieldView() -> some View {
        VStack(alignment: .leading, spacing: 0) {
            if isLoading {
                DotLottieAnimation(fileName: "LoadingDotsBlue", config: AnimationConfig(autoplay: true, loop: true)).view()
                    .frame(width: 200, height: 100, alignment: .leading)
                    .padding(.bottom, -40)
                    .padding(.leading, -45)
            }
            HStack {
                LLMTextFieldView(placeholder: "Ask me!", textFieldText: $textFieldText, isFieldFocused: $isTextFieldFocused)
                    .padding(.leading)
                
                Button {
                    isLoading.toggle()
                    isSendDisabled.toggle()
                    isTextFieldFocused = false
                    Task {
                        let captureText = textFieldText
                        textFieldText = ""
                        do {
                            try await llmChatVM.fetchResponse(userMessage: captureText)
                            isSendDisabled.toggle()
                            isLoading.toggle()
                        } catch {
                            isSendDisabled.toggle()
                            isLoading.toggle()
                        }
                    }
                    
                } label: {
                    Image(systemName: "arrow.up.message.fill")
                        .resizable()
                        .font(.headline)
                        .foregroundStyle(isSendDisabled || textFieldText.isEmpty ? .gray : .customBlue)
                        .frame(width: 35, height: 35)
                        .padding(.trailing)
                }
                .disabled(isSendDisabled || textFieldText.isEmpty)
            }
        }
        .frame(alignment: .bottom)
    }
    
   
}

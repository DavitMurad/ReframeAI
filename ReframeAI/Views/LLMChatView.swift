//
//  LLMChatView.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 17.05.26.
//

import SwiftUI
import DotLottie


struct LLMChatView: View {
    @StateObject var llmChatVM = LLMChatViewModel()
    @State var textFieldText = ""
    @FocusState var isTextFieldFocused: Bool
    @State var isSendDisabled = false
    @State var isLoading = false

    
    var body: some View {
        ScrollView {
            ScrollViewReader { proxy in
                VStack {
                    messageBoxes()
                        .padding(.horizontal)
                }
                .id(0)
                .onChange(of: llmChatVM.llmChatHistory.count) { _, _ in
                    withAnimation(.easeInOut) {
                        proxy.scrollTo(0, anchor: .bottom)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .contentShape(Rectangle())
        .onTapGesture {
            isTextFieldFocused = false
        }
        
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
                            try await llmChatVM.fetchResponse(userMessage: captureText)
                            
                            isSendDisabled.toggle()
                            isLoading.toggle()
                    }
                    
                } label: {
                    Image(systemName: "arrow.up.message.fill")
                        .resizable()
                        .font(.headline)
                        .foregroundStyle(isSendDisabled || textFieldText.isEmpty ? .gray : .customBlue)
                        .frame(width: 40, height: 40)
                        .padding(.trailing)
                }
                .disabled(isSendDisabled || textFieldText.isEmpty)
            }
        }
        .frame(alignment: .bottom)
    }
}

//#Preview {
//    LLMChatView()
//}

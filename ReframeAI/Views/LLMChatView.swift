//
//  LLMChatView.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 17.05.26.
//

import SwiftUI

struct LLMChatView: View {
    @StateObject var llmChatVM = LLMChatViewModel()
    @State var textFieldText = ""
    @State var llmResponseText = ""
    
    @State var anchor: CGFloat = 0
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    messageBoxes()
                        .padding(.horizontal)
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                
              
                
            }
        }
        VStack {
            TextField("Placeholder", text: $textFieldText)
            
            Button("asd") {
                Task {
                    await llmChatVM.fetchResponse(userMessage: textFieldText)
                    llmResponseText = llmChatVM.llmLastResponse
                    print(String(describing: llmChatVM.llmChatHistory))
                    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        
    }
}

extension LLMChatView {
    func messageBoxes() -> some View {
        ForEach(llmChatVM.llmChatHistory, id: \.self) { message in
            if message["role"] == "user" {
                Text(message["content"]!)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(.customBlue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            } else {
                Text(message["content"]!)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(.orange)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    LLMChatView()
}

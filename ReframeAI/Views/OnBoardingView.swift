//
//  OnBoarding.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 17.05.26.
//

import SwiftUI

struct OnBoardingView: View {
    @StateObject var llmChatVM = LLMChatViewModel()
    @State var textFieldText = ""
    
    var body: some View {
        VStack {
            TextField("Placeholder", text: $textFieldText)
            
            Button("asd") {
                Task {
                    await llmChatVM.fetchResponse(userMessage: textFieldText)
                    print(llmChatVM.llmResponse)
                }

            }
        }
    }
}

//#Preview {
//    OnBoardingView()
//}

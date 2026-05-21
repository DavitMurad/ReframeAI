//
//  LLMChatView.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 17.05.26.
//

import SwiftUI

struct LLMChatView: View {
    @StateObject var llmChatVM = LLMChatViewModel()
    @Binding var path: [NavRoute]
    @State var textFieldText = ""
    @FocusState var isTextFieldFocused: Bool
    @State var isSendDisabled = false
    @State var isLoading = false
    @State var errorMessage = ""

    var body: some View {
        setupChatView()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        
        setupTextFieldView()
        .frame(alignment: .bottom)
        .navigationBarBackButtonHidden()
    }
}


//#Preview {
//    LLMChatView()
//}

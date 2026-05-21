//
//  TransformedTextView.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 21.05.26.
//

import SwiftUI

struct TransformedTextView: View {
    @State var initialText = "I have graduated."
    @State var itemAngle: Double = 0.0
    
    let originalText = "I have graduated."
    let tone: String
    let transformedText: String
    let alignment: Alignment
    
    
    var body: some View {
        
        VStack(spacing: 5) {
            Text(tone)
                .font(.headline)
            MessageView(message: initialText, color: .customBlue, alignment: alignment)
                .rotation3DEffect(.degrees(itemAngle),axis: (x: 0 , y: 1, z: 0))
                .onTapGesture {
                    withAnimation {
                        itemAngle = itemAngle == 360 ? 0 : 360
                        initialText =
                        initialText == transformedText
                        ? originalText
                        : transformedText
                    }
                    
                }
        }
    }
}



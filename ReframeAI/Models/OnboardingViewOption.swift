//
//  OnboardingViewOption.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 21.05.26.
//

import Foundation

enum OnBoardingViewOption: Int, CaseIterable {
    case welcome
    case beforeAfter
    case options
    
    var title: String {
        switch self {
        case .welcome:
            return "Rewrite Anything, Smarter"
        case .beforeAfter:
            return "See the difference"
        case .options:
            return "Your Style, Your Voice"

        }
    }
    
    var subtitle: String {
        switch self {
        case .welcome:
            return "Turn everyday messages into clear, confident, and professional communication in seconds."
        case .beforeAfter:
            return "From quick thoughts to polished messages instantly. No effort, just better communication."
        case .options:
            return "Choose how you want to sound: friendly, professional, or sharp and concise."
        }
    }
}

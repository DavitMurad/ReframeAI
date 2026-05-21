//
//  ReframeAIApp.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 17.05.26.
//

import SwiftUI
enum NavRoute {
    case onboardingview
    case chatview
}

@main
struct ReframeAIApp: App {
    var body: some Scene {
        WindowGroup {
            OnBoardingView()
                .preferredColorScheme(.light)
        }
    }
}

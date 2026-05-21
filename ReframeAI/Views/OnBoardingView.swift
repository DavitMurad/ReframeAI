//
//  OnBoarding.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 17.05.26.
//

import SwiftUI
struct OnBoardingView: View {
    
    @State var currentView = 0
    @State var itemAngle = 0.0

    @State var path: [NavRoute] = []
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(.primary)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(.secondary)
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.white, Color(white: 0.75)]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                setupTabBar()
                .navigationDestination(for: NavRoute.self) { route in
                    LLMChatView(path: $path)
                }
            }
        }
    }
}


#Preview {
    OnBoardingView()
}

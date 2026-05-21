//
//  OnBoardingViewExtension.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 21.05.26.
//

import SwiftUI

extension OnBoardingView {
    @ViewBuilder
    func getOnboardingView(for option: OnBoardingViewOption) -> some View {
        VStack(spacing: 20) {
            Text(option.title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            determineComponent(for: option)
                .frame(height: 500)
            
            Text(option.subtitle)
                .font(.caption)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            Button {
                if option.rawValue < 2 {
                    currentView += 1
                } else {
                    path.append(.chatview)
                }
            } label: {
                Text(option.rawValue < 2 ? "Continue" : "Start")
                    .frame(width: 300)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.customBlue)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .contentShape(Rectangle())
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func determineComponent(for option: OnBoardingViewOption) -> some View {
        switch option {
        case .welcome:
            setupWelcomeView()
        case .beforeAfter:
            setupBeforeAfterView()
        case .options:
            setupOptionView()
        }
    }
    
    @ViewBuilder
    func setupTabBar() -> some View {
        TabView(selection: $currentView) {
            ForEach(OnBoardingViewOption.allCases, id: \.self) { viewOption in
                getOnboardingView(for: viewOption)
                    .tag(viewOption.rawValue)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .animation(.spring, value: currentView)
    }
    
    
    @ViewBuilder
    func setupWelcomeView() -> some View {
        Image("phone3")
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 400)
            .padding(.horizontal)
    }
    
    @ViewBuilder
    func setupBeforeAfterView() -> some View {
        VStack(spacing: 25) {
            Group {
                MessageView(message: "I was fired", color: .customBlue, alignment: .center)
                
                Image(systemName: "shuffle").rotationEffect(Angle(degrees: 90.0))
                    .font(.title)
                    .fontWeight(.bold)
                
                MessageView(message: "I think you mean: \'I am now exploring new opportunities aligned with my long-term goals.\'", color: .white, alignment: .center)
            }
            .padding()
        }
        .background(.ultraThickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
    }
    @ViewBuilder
    func setupOptionView() -> some View {
        VStack(spacing: 50) {
            Group {
                HStack {
                    TransformedTextView(tone: "Friendly", transformedText: "I’ve just graduated and I’m excited to start what’s next.", alignment: .leading)
                    
                    TransformedTextView(tone: "Professional", transformedText: "I have recently completed my degree and am eager to begin the next stage of my professional journey.", alignment: .leading)
                }
                
                TransformedTextView(tone: "Concise", transformedText: "Graduated and ready for the next step.", alignment: .center)
            }
            .padding()
        }
        .background(.ultraThickMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 10)
    }
}

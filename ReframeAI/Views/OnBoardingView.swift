//
//  OnBoarding.swift
//  ReframeAI
//
//  Created by Davit Muradyan on 17.05.26.
//

import SwiftUI

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

struct OnBoardingView: View {
    
    @State private var currentView = 0
    @State var itemAngle = 0.0

    @State var path: [NavRoute] = []
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(.primary)
        UIPageControl.appearance().pageIndicatorTintColor = UIColor(.secondary)
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                TabView(selection: $currentView) {
                    ForEach(OnBoardingViewOption.allCases, id: \.self) { viewOption in
                        getOnboardingView(for: viewOption)
                            .tag(viewOption.rawValue)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .animation(.spring, value: currentView)
                .navigationDestination(for: NavRoute.self) { route in
                    LLMChatView(path: $path)
                }
            }.background(
                LinearGradient(gradient: Gradient(colors: [.white, Color(white: 0.75)]), startPoint: .top, endPoint: .bottom)

            )
        }
    }
    
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
//            ZStack {
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(.white)
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                    .shadow(radius: 10)
                Image("phone3")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 400)
                    .padding(.horizontal)
             
//            }

        case .beforeAfter:
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
        case .options:
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
    
    
}


#Preview {
    OnBoardingView()
}

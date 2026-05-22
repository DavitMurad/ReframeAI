# ReframeAI

## About 🤌


ReframeAI is an iOS app that rewrites your messages into LinkedIn and CV-friendly language. You type your raw thought, the AI returns a polished version. Simple as that. 

**'I was fired'** → **'I am now exploring new opportunities aligned with my long-term goals.'"**

https://github.com/user-attachments/assets/686a3e8e-5798-40da-b300-1a9d10fd2fd3

## Technologies Used
- **SwiftUI** - entire UI built natively with modern declarative syntax
- **MVVM** - clean separation between Network, ViewModel, and View layers
- **OpenRouter API** - bridging to a 3rd party LLM for intelligent text transformation
- **DotLottie** - for smooth, lightweight loading animations
- **Swift Concurrency (async/await)** - handling network calls cleanly without callback hell

## Highlights
- **Stateful conversation history** - full chat context sent on every request, so the AI remembers what you said  
- **Interactive onboarding** - 3D flip card animations that demonstrate the product rather than just describe it
- **Perceived value > effort required** - the app demonstrates exactly what it does through interactive examples before the user types a single word; no sign-up, no friction, just the product proving itself first
- **Inline error handling** - failures surface naturally in the chat flow, not as jarring alerts. See an example below:
<img width="379" height="798" alt="Screenshot 2026-05-21 at 20 46 38" src="https://github.com/user-attachments/assets/ea4fa3ee-cead-47ef-a6e9-cb5a4f017e51" />

- **Disabled state management** - button states, loading indicators, and keyboard handling all working in harmony  
- **Layered architecture** - NetworkManager, ViewModel, and View each doing exactly one job  

## Challenges & Learnings
- **LLM integration from scratch** - getting the message history format right, understanding how roles work (user, assistant, system), and structuring the request body took more iteration than expected  
- **System prompt placement** - learned that the agent instructions need to be prepended to every request, not stored in history   

## Reflection
Definitely one of my favourite projects. I've touched LLMs before, but never integrated one to this extent. Managing conversation state, crafting system prompts, handling the full request/response lifecycle.

The timing tells the story: the process felt genuinely smooth. A great excuse to sharpen some SwiftUI instincts, and build something that could actually live on someone's phone.

Persistence is the obvious next step, saving chat history locally , but given we're borrowing OpenRouter's API, there's a balance to strike there.

Time for the next cool system.  

Thanks for stopping by.  

LLM enthusiast since 2022.  

Cheers ✌️

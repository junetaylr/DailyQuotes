//
//  quoteview.swift
//  dailyquotes
//
//  Created by june taylr on 7/4/25.
//

import SwiftUI

struct QuoteView: View {
    var name: String
    var zodiac: String
    var mood: String

    let quotes = [
        "Keep going, you're doing better than you think.",
        "Every moment is a fresh beginning.",
        "You are your best investment.",
        "Breathe. Let it go. Refocus.",
        "You are made of strength and stardust.",
        "Progress, not perfection."
    ]

    var randomQuote: String {
        quotes.randomElement() ?? "Stay inspired."
    }

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.482, green: 0.757, blue: 0.341, alpha: 1)), Color(#colorLiteral(red: 1.0, green: 0.482, blue: 0.482, alpha: 1))]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                Text("Welcome, \(name.capitalized)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                VStack(spacing: 10) {
                    Text("🌞 Zodiac: \(zodiac)")
                    Text("💭 Mood: \(mood.capitalized)")
                }
                .font(.headline)
                .foregroundColor(.white.opacity(0.9))

                Divider()
                    .background(Color.white.opacity(0.8))
                    .padding(.horizontal)

                Text("✨ \(randomQuote)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(.horizontal)

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    QuoteView(name: "June", zodiac: "Virgo", mood: "Focused")
}


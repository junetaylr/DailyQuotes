//
//  ContentView.swift
//  dailyquotes
//
//  Created by june taylr on 7/4/25.
//

import SwiftUI

struct ContentView: View {
    // List of motivational quotes
    let quotes = [
        "Believe in yourself and all that you are.",
        "Keep going. Everything you need will come to you.",
        "You are capable of amazing things.",
        "Don't watch the clock; do what it does. Keep going.",
        "Success is built on consistency, not perfection.",
        "Your only limit is your mind.",
        "Progress, not perfection."
    ]

    @State private var currentQuote = "Tap the button for today's quote"
    @State private var animateGlow = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.6), Color.red.opacity(0.6)]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 40) {
                Text(currentQuote)
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(.white)

                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.15))
                        .frame(height: 55)
                        .overlay(
                            Text("Show Me a Quote")
                                .font(.headline)
                                .foregroundColor(.white)
                        )
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white.opacity(0.2), Color.white.opacity(0.6), Color.white.opacity(0.2)]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            .rotationEffect(.degrees(30))
                            .offset(x: animateGlow ? 300 : -300)
                            .mask(
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(height: 55)
                            )
                            .animation(Animation.linear(duration: 3).repeatForever(autoreverses: false), value: animateGlow)
                        )
                        .onAppear {
                            animateGlow = true
                        }
                        .onTapGesture {
                            currentQuote = quotes.randomElement() ?? "Stay inspired!"
                        }
                        .padding(.horizontal)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}



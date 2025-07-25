//
//  HomeMenuView.swift
//  dailyquotes
//
//  Created by june taylr on 7/4/25.
//

import SwiftUI

struct HomeMenuView: View {
    @State private var name = ""
    @State private var birthDate = Date()
    @State private var zodiacSign = ""
    @State private var favoriteColor = ""
    @State private var energyWord = ""
    @State private var showQuotePage = false

    let zodiacOptions = [
        "Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo",
        "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"
    ]

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.blue.opacity(0.6)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        Text("Let’s Get to Know You")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top, 20)

                        Group {
                            TextField("What's your name?", text: $name)

                            DatePicker("Birthday", selection: $birthDate, displayedComponents: .date)

                            Picker("Zodiac Sign", selection: $zodiacSign) {
                                ForEach(zodiacOptions, id: \.self) { sign in
                                    Text(sign)
                                }
                            }

                            TextField("Favorite color?", text: $favoriteColor)

                            TextField("Describe your energy today in one word:", text: $energyWord)
                        }
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .accentColor(.white)

                        Button(action: {
                            showQuotePage = true
                        }) {
                            Text("Continue")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(12)
                                .foregroundColor(.white)
                                .font(.headline)
                        }

                        // 🔁 Navigation to QuoteView
                        NavigationLink(
                            destination: QuoteView(
                                name: name,
                                zodiac: zodiacSign,
                                mood: energyWord
                            ),
                            isActive: $showQuotePage
                        ) {
                            EmptyView()
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    HomeMenuView()
}




//
//  signupview.swift
//  dailyquotes
//
//  Created by june taylr on 7/4/25.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss

    @State private var email = ""
    @State private var password = ""
    @State private var animateGlow = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.green.opacity(0.6), Color.red.opacity(0.6)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 24) {
                // 🔷 App Logo
                Image("daily")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)

                // ✏️ Email Field
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(12)
                    .foregroundColor(.white)

                // 🔐 Password Field
                SecureField("Create Password", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(12)
                    .foregroundColor(.white)

                // ✨ Create Account Button with shimmer effect
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.15))
                        .frame(height: 55)
                        .overlay(
                            Text("Create Account")
                                .font(.headline)
                                .foregroundColor(.white)
                        )
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.white.opacity(0.1),
                                    Color.white.opacity(0.6),
                                    Color.white.opacity(0.1)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            .rotationEffect(.degrees(30))
                            .offset(x: animateGlow ? 300 : -300)
                            .mask(
                                RoundedRectangle(cornerRadius: 12)
                                    .frame(height: 55)
                            )
                            .animation(
                                Animation.linear(duration: 2)
                                    .repeatForever(autoreverses: false),
                                value: animateGlow
                            )
                        )
                        .onAppear {
                            animateGlow = true
                        }
                        .onTapGesture {
                            print("Account created.")
                            dismiss()
                        }
                        .padding(.horizontal)
                }

                // 🔁 Already have account link
                Button(action: {
                    dismiss()
                }) {
                    Text("Already have an account? Log In")
                        .font(.footnote)
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            .padding()
        }
    }
}

#Preview {
    SignUpView()
}


//
//  loginview.swift
//  dailyquotes
//
//  Created by june taylr on 7/4/25.
//

import SwiftUI
import LocalAuthentication

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var authError: String?
    @State private var showingSignUp = false
    @State private var animateGlow = false

    var body: some View {
        if isLoggedIn {
            HomeMenuView()
        } else {
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
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(12)
                        .foregroundColor(.white)

                    // ✨ Glowing Log In Button
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.15))
                            .frame(height: 55)
                            .overlay(
                                Text("Log In")
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
                                if !email.isEmpty && !password.isEmpty {
                                    isLoggedIn = true
                                }
                            }
                            .padding(.horizontal)
                    }

                    // 🧠 Face ID Option
                    Button(action: authenticateWithFaceID) {
                        HStack {
                            Image(systemName: "faceid")
                            Text("Login with Face ID")
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                    }

                    // 🧷 Forgot Password Link
                    Button(action: {
                        print("Redirect to forgot password flow")
                    }) {
                        Text("Forgot password?")
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.8))
                    }

                    // 🆕 Sign Up Link
                    Button(action: {
                        showingSignUp = true
                    }) {
                        Text("Don't have an account? Sign Up")
                            .font(.footnote)
                            .foregroundColor(.white.opacity(0.8))
                    }
                    .sheet(isPresented: $showingSignUp) {
                        SignUpView()
                    }

                    // 🛑 Error (if any)
                    if let error = authError {
                        Text(error)
                            .foregroundColor(.red)
                            .font(.caption)
                    }
                }
                .padding()
            }
        }
    }

    // ✅ Face ID Function
    func authenticateWithFaceID() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Log in with Face ID"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        isLoggedIn = true
                    } else {
                        authError = "Face ID failed. Try again."
                    }
                }
            }
        } else {
            authError = "Face ID not available on this device."
        }
    }
}

#Preview {
    LoginView()
}





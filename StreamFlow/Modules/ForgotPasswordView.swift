
//  ForgotPasswordView.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 22/05/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @ObservedObject var viewModel: LoginViewViewModel
    
    var body: some View {
        ZStack {
            Color(red: 18/255, green: 31/255, blue: 61/255).ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Recover Password")
                    .font(.title)
                    .foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255))
                
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("Email")
                            .font(.caption)
                            .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255))
                            .padding(.leading, 8)
                    }
                    
                    TextField("", text: $email)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5.0)
                        .foregroundColor(.black)
                }
                
                Button(action: {
                    // Agrega aquí la lógica para resetear la contraseña
                    viewModel.forgotPasswordEmail = email
                    viewModel.forgotPassword()
                }) {
                    Text("Reset Password")
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(6)
                        .overlay(RoundedRectangle(cornerRadius: 6)
                            .stroke(Color("Dark-Cyan"), lineWidth: 3))
                }
                
            }
            .padding()
        }
        .navigationTitle("StreamFlow")
        
    }
}

#Preview {
    ForgotPasswordView(viewModel: LoginViewViewModel())
}


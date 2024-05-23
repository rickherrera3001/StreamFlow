//
//  ForgotPasswordView.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 22/05/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @EnvironmentObject private var viewModel: LoginViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 18/255, green: 31/255, blue: 61/255).ignoresSafeArea()
                
                VStack {
                    Text("Recover Password")
                        .font(.title)
                        .foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255, opacity: 1.0))
                        .padding(.bottom, 20)
                    
                    ZStack(alignment: .leading) {
                        if email.isEmpty {
                            Text("Email")
                                .font(.caption)
                                .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                        }
                        
                        TextField("", text: $email)
                            .padding()
                            .background(Color.gray)
                            .cornerRadius(5.0)
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 20)
                    
                    Button(action: {
                        // Agrega aquí la lógica para resetear la contraseña
                    }) {
                        Text("Reset Password")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .frame(maxWidth: .infinity)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(Color.gray)
                            .cornerRadius(6)
                            .overlay(RoundedRectangle(cornerRadius: 6)
                                        .stroke(Color("Dark-Cyan"), lineWidth: 3)
                                        .shadow(color: .white, radius: 6))
                    }
                    .padding(.bottom, 20)
                    
                    Text("Cancel")
                        .foregroundColor(.green)
                        .padding(.bottom, 20)
                        .onTapGesture {
                            viewModel.dismissForgotPasswordView()
                        }
                }
                .padding()
            }
            .navigationTitle("StreamFlow")
        }
    }
}

#Preview {
    ForgotPasswordView()
}

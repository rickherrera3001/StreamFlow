//
//  RegisterView.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 22/05/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var fullName: String = ""
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @EnvironmentObject private var viewModel: LoginViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 18/255, green: 31/255, blue: 61/255).ignoresSafeArea()
                
                VStack {
                    Text("Register View")
                        .font(.title)
                        .foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255, opacity: 1.0))
                        .padding(.bottom, 20)
                    
                    TextField("Full Name", text: $fullName)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(5.0)
                        .foregroundColor(.black)
                        .padding(.bottom, 20)
                    
                    TextField("Email Address", text: $emailAddress)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(5.0)
                        .foregroundColor(.black)
                        .padding(.bottom, 20)
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(5.0)
                        .foregroundColor(.black)
                        .padding(.bottom, 20)
                    
                    Button(action: {
                        viewModel.register()
                    }) {
                        Text("Register")
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
                }
                .padding()
            }
            .navigationTitle("StreamFlow")
            .foregroundColor(.green) // Cambiar el color del texto del navigationTitle a verde
        }
    }
}

#Preview {
    RegisterView()
}

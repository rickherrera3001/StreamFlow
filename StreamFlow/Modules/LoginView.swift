////
////  LoginViewModel.swift
////  StreamFlow
////
////  Created by Ricardo Developer on 21/05/24.

import SwiftUI

struct LoginView: View {
    //@AppStorage("isLoggedIn") private var isLoggedIn = false
    @StateObject  var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 18/255, green: 31/255, blue: 61/255).ignoresSafeArea()
                
                VStack {
                    Image("App Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 110)
                        .padding(.bottom, 60.0)
                        .padding(.top, 50)
                    
                    VStack(alignment: .leading) {
                        if !viewModel.errorMessage.isEmpty{
                            Text(viewModel.errorMessage)
                                .foregroundColor(.red)
                        }
                        
                        
                        TextField("Email Address", text: $viewModel.email)
                            .background(Color(red: 18/255, green: 31/255, blue: 61/255))
                            .autocapitalization(.none)
                        
                        ZStack(alignment: .leading) {
                            if viewModel.email.isEmpty {
                                Text("example@gmail.com")
                                    .font(.caption)
                                    .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                            }
                            
                            TextField("", text: $viewModel.email)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5.0)
                                .foregroundColor(.black)
                        }
                        
                        Text("Password")
                            .foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255, opacity: 1.0))
                            .padding(.top, 20)
                        
                        ZStack(alignment: .leading) {
                            if viewModel.password.isEmpty {
                                Text("Enter your password")
                                    .font(.caption)
                                    .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                            }
                            
                            SecureField("Password", text: $viewModel.password)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5.0)
                                .foregroundColor(.black)
                        }
                        
                        Text("Forgot Password?")
                            .font(.footnote)
                            .frame(width: 300, alignment: .trailing)
                            .foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255))
                            .padding(.top, 10)
                            .onTapGesture {
                                viewModel.isForgotPasswordSuccess = true
                            }
                    }
                    .padding(.horizontal)
                    
                    Button(action: {
                        viewModel.login()
                    }) {
                        if viewModel.isLoading {
                            ProgressView()
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(5.0)
                        } else {
                            Text("Login")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(5.0)
                        }
                    }
                    .padding(.top, 20)
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .padding(.top, 10)
                    }
                    
                    NavigationLink(destination: ForgotPasswordView(viewModel: viewModel), isActive: $viewModel.isForgotPasswordSuccess) {
                        EmptyView()
                    }
                    
                    Text("Create An Account")
                        .foregroundColor(.green)
                        .padding(.top, 10)
                        .onTapGesture {
                            viewModel.showRegisterView = true
                        }
                    
                    NavigationLink(destination: RegisterView(), isActive: $viewModel.showRegisterView) {
                        EmptyView()
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("StreamFlow")
        }
    }
}

#Preview {
    LoginView()
}



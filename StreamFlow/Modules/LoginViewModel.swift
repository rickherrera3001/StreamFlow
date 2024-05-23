//
//  LoginViewModel.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.
//


import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showForgotPasswordView: Bool = false
    @Published var showRegisterView: Bool = false
    
    func login() {
        // Agrega tu lógica de autenticación aquí
        print("Iniciando sesión con correo: \(email) y contraseña: \(password)")
    }
    
    func forgotPassword() {
        // Aquí puedes manejar el flujo de recuperación de contraseña
        print("Recuperación de contraseña para el correo: \(email)")
        showForgotPasswordView = true
    }
    
    func register() {
        // Aquí puedes manejar el flujo de registro de usuario
        print("Registrando un nuevo usuario")
        showRegisterView = true
    }
    
    func dismissForgotPasswordView() {
        // Aquí puedes manejar el cierre de la vista de recuperación de contraseña
        showForgotPasswordView = false
    }
    
    func dismissRegisterView() {
        // Aquí puedes manejar el cierre de la vista de registro
        showRegisterView = false
    }
}


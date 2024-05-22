//
//  LoginViewModel.swift
//  StreamFlow
//
//  Created by Ricardo Developer on 21/05/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    
    // Aquí puedes agregar funciones para la lógica de autenticación, validación, etc.
    
    func login() {
        // Agrega tu lógica de autenticación aquí
        print("Iniciando sesión con correo: \(email) y contraseña: \(password)")
    }
}


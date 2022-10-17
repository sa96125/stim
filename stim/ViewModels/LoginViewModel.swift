//
//  Login.swift
//  stim
//
//  Created by chaplin on 2022/10/11.
//

import SwiftUI

enum LoginError: Error, LocalizedError {
    case emailEmpty
    case emailInvalid
    case passwordEmpty
    
    var errorDescription: String? {
        switch self {
            case .emailEmpty:
                return "Email cannot be empty"
            case .emailInvalid:
                return "Email is not in correct format"
            case .passwordEmpty:
                return "Password connot be empty"
        }
    }
}

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var emailError: LoginError?
    @Published var passwordError: LoginError?
    
    func isValid() -> Bool {
        clearErrors()
        
        if email.isEmpty {
            emailError = LoginError.emailEmpty
        } else if !email.isValidEmail {
            emailError = LoginError.emailInvalid
        }

        if password.isEmpty {
            passwordError = LoginError.passwordEmpty
        }

        return emailError == nil && passwordError == nil
     }
    
    func clearErrors() {
        emailError = nil
        passwordError = nil
    }
    
}

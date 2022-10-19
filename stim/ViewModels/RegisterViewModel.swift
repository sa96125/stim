//
//  RegisterViewModel.swift
//  stim
//
//  Created by chaplin on 2022/10/16.
//

import Foundation

enum RegisterStep: Int, CaseIterable  {
    case mobile
    case otp
    case email
    case password
    
    var title: String {
        switch self {
        case .mobile: return "Enter mobile number"
        case .otp: return "Enter auth number"
        case .email: return "New email address"
        case .password: return "New password"
        }
    }
    
    var buttonText: String {
        switch self {
        case .mobile: return "다음"
        case .otp: return "확인"
        case .email: return "다음"
        case .password: return "완료"
        }
    }
}

enum RegisterError: Error, LocalizedError {
    case mobileEmpty
    case mobileInvalid
    case otpEmpty
    case emailEmpty
    case emailInvalid
    case passwordEmpty
    case passwordInvalid
    
    var errorDescription: String? {
        switch self {
        case .mobileEmpty:
            return "Mobile Number cannot be empty"
        case .mobileInvalid:
            return "Mobile Number is not in correct format"
        case .otpEmpty:
            return "Auth Number cannot be empty"
        case .emailEmpty:
            return "Email cannot be empty"
        case .emailInvalid:
            return "Email is not in correct format"
        case .passwordEmpty:
            return "Password connot be empty"
        case .passwordInvalid:
            return "Password is not in correct format"
        }
    }
}

class RegisterViewModel: ObservableObject {
    
    @Published var currentStep: RegisterStep = .mobile
    @Published var timer = Timer()
    @Published var timeRemainder: Double = 180
    @Published var showLoginView: Bool = false
    @Published var mobile: String = ""
    @Published var otp: String = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 6)
    @Published var email: String = ""
    @Published var password: String = ""
    
    // MARK: Error
    @Published var mobileError: RegisterError?
    @Published var otpError: RegisterError?
    @Published var emailError: RegisterError?
    @Published var passwordError: RegisterError?
    
    
    func isMobileNumberValid() -> Bool {
        clearErrors()
        
        if mobile.isEmpty {
            mobileError = RegisterError.mobileEmpty
        }

        return mobileError == nil
     }
    
    func isAuthNumberValid() -> Bool {
        clearErrors()
        
        if otpFields.isEmpty {
            otpError = RegisterError.otpEmpty
        }

        return otpError == nil
     }
    
    func isEmailValid() -> Bool {
        clearErrors()
        
        if email.isEmpty {
            emailError = RegisterError.emailEmpty
        }

        return emailError == nil
     }
    
    func isPasswordValid() -> Bool {
        clearErrors()
        
        if password.isEmpty {
            passwordError = RegisterError.passwordEmpty
        }

        return passwordError == nil
     }
    
    func clearErrors() {
        mobileError = nil
        otpError = nil
        emailError = nil
        passwordError = nil
    }
    
    func startTimer() {
        clearTimer()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if timeRemainder > 0 {
            timeRemainder -= 1
        } else {
            clearTimer()
            print("DEBUG: time up! ")
        }
    }
    
    func clearTimer() {
        timer.invalidate()
    }
    
}


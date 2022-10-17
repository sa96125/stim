//
//  AuthViewModel.swift
//  stim
//
//  Created by chaplin on 2022/10/16.
//

import SwiftUI
import FirebaseAuth
import Firebase

@MainActor
class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(_ email: String, _ password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func logout() {
        print("logout")
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func createUser(withEmail email: String, password: String, mobileNumber: String) {
        print(email)
        print(password)
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
        }
    }
    
    func updateUserInfo() {
        if let user = userSession {
            Firestore.firestore().collection("users")
                .document(user.uid)
        }
    }
    
    func sendVerifyNumber(with mobileNumber: String) -> Bool {
        print("DEBUG: getting VerifyNumber...")
 
        print("DEBUG: save mobile number in server")
        
        return true
    }
    
    func verifyMobile(of mobileNumber:String, with verifyNumber: String) -> Bool {
        print("DEBUG: Matching VerifyNumber of Mobile...")
 
        print("DEBUG: check mobile - verifyNumber in server")
        
        return true
    }
}


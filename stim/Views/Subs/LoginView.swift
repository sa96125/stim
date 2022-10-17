//
//  LoginView.swift
//  stim
//
//  Created by chaplin on 2022/10/11.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var loginViewModel = LoginViewModel()
    @FocusState private var emailInFocus: Bool
    @FocusState private var passwordInFocus: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                
                emailTextField
                
                passwordTextField
                
                Spacer()
                
                Text("비밀번호를 잊으셨나요?")
                    .font(.caption)
                    .padding()
                
                loginButton
                
            }
            .navigationTitle("Sign in with Email")
        }
    }
}

extension LoginView {
    
    private var emailTextField : some View {
        VStack {
            TextField("\(loginViewModel.emailError?.localizedDescription ?? "이메일 주소")", text: $loginViewModel.email)
                .textInputAutocapitalization(.never)
                .font(.subheadline)
                .padding(.all, 6)
                .focused($emailInFocus)
            
            Capsule()
                .foregroundColor(emailInFocus ? .black : .gray)
                .frame(height: emailInFocus ? 2 : 1)
        }
        .padding()
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.emailInFocus = true
            }
        }
    }
    
    private var passwordTextField : some View {
        VStack {
            HStack {
                SecureField("\(loginViewModel.passwordError?.localizedDescription ?? "비밀번호")", text: $loginViewModel.password)
                    .padding(.all, 6)
                    .font(.subheadline)
                    .focused($passwordInFocus)
                
                Spacer()
                
                Image(systemName: "lock.shield")
            }

            Capsule()
                .foregroundColor(passwordInFocus ? .black : .gray)
                .frame(height: passwordInFocus ? 2 : 1)
        }.padding()
    }
    
    private var loginButton : some View {
        Button  {
            if loginViewModel.isValid() {
                authViewModel.login(loginViewModel.email, loginViewModel.password)
            }
        } label: {
            Text("로그인")
                .foregroundColor(.white)
                .frame(height:65)
                .frame(maxWidth: .infinity)
                .background(.black)
        }
    }
    
}

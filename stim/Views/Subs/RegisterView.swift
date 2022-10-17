//
//  RegisterView.swift
//  stim
//
//  Created by chaplin on 2022/10/16.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var registerViewModel: RegisterViewModel = .init()
    
    @FocusState private var activeMobileField: Bool
    @FocusState private var activeOtpFeild: Bool
    @FocusState private var activeEmailFeild: Bool
    @FocusState private var activePasswordField: Bool
    
    var maxDigits: Int = 6
    @State var isDisabled = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                Group {
                    switch registerViewModel.currentStep {
                    case .mobile :
                        mobileTextField
                    case .otp :
                        otpTextFields
                    case .email :
                        emailTextField
                    case .password:
                        passwordTextField
                    }
                }
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing ),
                    removal: .move(edge: .leading)
                ))
                .animation(.easeInOut(duration: 0.5), value: registerViewModel.currentStep)
                
                
                nextButton
                
            }
            .navigationTitle(registerViewModel.currentStep.title)
        }
    }
}

extension RegisterView {
    
    private var mobileTextField : some View {
        VStack {
            VStack {
                TextField("휴대폰 번호", text: $registerViewModel.mobile)
                    .textInputAutocapitalization(.never)
                    .font(.subheadline)
                    .padding(.all, 6)
                    .focused($activeMobileField)
                    .keyboardType(.numberPad)
                
                Capsule()
                    .foregroundColor(.black)
                    .frame(height:2)
            }.padding()
            
            Spacer()
            
            Button() {
                registerViewModel.showLoginView.toggle()
            } label: {
                Text("이미 계정이 있으신가요? 로그인")
                    .font(.caption)
                    .padding()
                    .padding(.horizontal)
                    .foregroundColor(.black)
            }
            .fullScreenCover(isPresented: self.$registerViewModel.showLoginView){
                LoginView()
            }
           
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.activeMobileField = true
            }
        }
    }
    
    func getDisit(at index: Int) -> String {
        if index >= self.registerViewModel.otp.count {
            return " "
        }
        return self.registerViewModel.otp.digits[index].numberString
    }
    
    private var backgroundField: some View {
        let boundOTP = Binding<String>(get: { self.registerViewModel.otp }, set: { newValue in
            self.registerViewModel.otp = newValue
        })
        
        return TextField("", text: boundOTP)
            .font(.subheadline)
            .focused($activeOtpFeild)
            .padding(.all, 6)
            .accentColor(.clear)
            .foregroundColor(.clear)
            .keyboardType(.numberPad)
            .disabled(isDisabled)
            .focused($activeOtpFeild)
    }

    
    private var otpTextFields : some View {
        ZStack {
            VStack {
                HStack(spacing:6) {
                    ForEach(0 ..< maxDigits, id: \.self) { index in
                        VStack(spacing: 6) {
                            Text(self.getDisit(at:index))
                                .font(.subheadline)
                                .padding(.all, 6)
                            
                            Capsule()
                                .foregroundColor(.black)
                                .frame(height:2)
                        }
                    }
                }.padding()
                
                Spacer()
                
                Text("\(registerViewModel.timeRemainder.formatMmSs())")
                    .font(.caption)
                    .padding()
            }

            
            backgroundField
        }
        .onAppear {
            DispatchQueue.main.async {
                self.activeOtpFeild = true
                registerViewModel.startTimer()
            }
        }
        .onDisappear {
            DispatchQueue.main.async {
                registerViewModel.clearTimer()
            }
        }
    }
    
    private var emailTextField : some View {
        VStack {
            
            VStack {
                TextField("이메일", text: $registerViewModel.email)
                    .focused($activeEmailFeild)
                    .textInputAutocapitalization(.never)
                    .font(.subheadline)
                    .padding(.all, 6)
                
                Capsule()
                    .foregroundColor(.black)
                    .frame(height:2)
            }.padding()
            
            Spacer()
            
            Text(registerViewModel.emailError?.localizedDescription ?? "스팀과 함께 건강한 운동습관을 만들어보세요!")
                .font(.caption)
                .padding()
            
        }
        .onAppear {
            DispatchQueue.main.async {
                self.activeEmailFeild = true
            }
        }
    }
    
    private var passwordTextField : some View {
        VStack {
            
            VStack {
                SecureField("비밀번호", text: $registerViewModel.password)
                    .focused($activePasswordField)
                    .textInputAutocapitalization(.never)
                    .font(.subheadline)
                    .padding(.all, 6)
                
                Capsule()
                    .foregroundColor(.black)
                    .frame(height:2)
            }.padding()
            
            Spacer()
            
            Text(registerViewModel.passwordError?.localizedDescription ?? "당신의 열정에 자극을!")
                .font(.caption)
                .padding()
            
        }
        .onAppear {
            DispatchQueue.main.async {
                self.activePasswordField = true
            }
        }
    }
    
    private var nextButton : some View {
        Button  {
            if registerViewModel.currentStep == .mobile && registerViewModel.isMobileNumberValid() {
                if authViewModel.sendVerifyNumber(with: registerViewModel.mobile) {
                    registerViewModel.currentStep = .otp
                }
                return
            }
            
            if registerViewModel.currentStep == .otp && registerViewModel.isAuthNumberValid() {
                if authViewModel.verifyMobile(of: registerViewModel.mobile, with: registerViewModel.mobile) {
                    registerViewModel.currentStep = .email
                }
                return
            }
            
            if registerViewModel.currentStep == .email && registerViewModel.isEmailValid() {
                registerViewModel.currentStep = .password
                return
            }
            
            if registerViewModel.currentStep == .password && registerViewModel.isPasswordValid() {
                authViewModel.createUser(
                    withEmail: registerViewModel.email,
                    password: registerViewModel.password,
                    mobileNumber: registerViewModel.mobile )
                return
            }
        } label: {
            Text(registerViewModel.currentStep.buttonText)
                .foregroundColor(.white)
                .frame(height:65)
                .frame(maxWidth: .infinity)
                .background(.black)
        }
    }
    
}

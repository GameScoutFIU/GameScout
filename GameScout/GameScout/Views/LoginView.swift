//
//  LoginView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/3/23.
//

import SwiftUI

struct LoginView: View {
    @State private var showRegister = false
    @State private var showForgotPassword = false
    @StateObject private var vm = LoginViewModelImpl(service: LoginServiceImpl())
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some View {
        ZStack {
            Color("theme")
                .ignoresSafeArea()
            VStack(spacing: 16) {
                TextInputView(text: $vm.credentials.email, placeholder: "Email", keyboardType: .emailAddress, sfSymbol: "envelope")
                    .padding(.horizontal, 15)
                PasswordInputView(password: $vm.credentials.password, placeholder: "Password", sfSymbol: "lock")
                    .padding(.horizontal, 15)
                ButtonView(title: "Sign In") {
                    vm.login()
                }
                .padding(.horizontal, 15)
                ButtonView(title: "Register",
                    background: .clear,
                    foreground: .white,
                    border: .white) {
                    showRegister.toggle()
                }
                .padding(.horizontal, 15)
                .sheet(isPresented: $showRegister, content: {
                    SignUpView()
                })
            }
        }
        .ignoresSafeArea(.keyboard)
    }
}

//#Preview {
//    LoginView()
//}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

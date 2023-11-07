//
//  PasswordResetView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/7/23.
//

import SwiftUI

struct PasswordResetView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject private var vm = ForgotPasswordViewModelImpl(service: ForgotPasswordServiceImpl())
    @EnvironmentObject var sessionService: SessionServiceImpl
    @State private var showAlert = false
    var body: some View {
        ZStack {
            Color("theme").edgesIgnoringSafeArea(.all)
            VStack(spacing: 16) {
                TextInputView(text: $vm.email, placeholder: "Email", keyboardType: .emailAddress, sfSymbol: "envelope")
                    .padding(.horizontal, 16)
                ButtonView(title: "Reset Password") {
                    vm.sendPasswordReset()
//                    presentationMode.wrappedValue.dismiss()
                    showAlert.toggle()
                }.padding(.horizontal, 16)
                    .alert("We'll send you an email to reset your password through Firebase", isPresented: $showAlert) {
                        Button("OK", role: .cancel) {sessionService.logout()}
                    }
                
                Text("Password Safety is Important! \nMake sure to use a strong password!\n")
                    .foregroundStyle(.white)
                    .font(.callout)
            }
        }
    }
}

#Preview {
    PasswordResetView()
}

//
//  PasswordResetView.swift
//  GameScout
//
//  Created by Rubens Inaba on 11/7/23.
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
            if (showAlert == false) {
                VStack(spacing: 16) {
                TextInputView(text: $vm.email, placeholder: "Email", keyboardType: .emailAddress, sfSymbol: "envelope")
                    .padding(.horizontal, 16)
                ButtonView(title: "Reset Password") {
                    vm.sendPasswordReset()
                    showAlert.toggle()
                }.padding(.horizontal, 16)
                Text("Password Safety is Important! \nMake sure to use a strong password!\n")
                    .foregroundStyle(.white)
                    .font(.callout)
                    .multilineTextAlignment(.center)
            }
            } else {
                SuccessUpdateView(message: "We've sent you an email to reset your password!")
            }
        }
    }
}

//#Preview {
//    PasswordResetView()
//}
struct PasswordResetView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordResetView()
    }
}

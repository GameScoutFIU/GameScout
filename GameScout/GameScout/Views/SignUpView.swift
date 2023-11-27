//
//  SignUpView.swift
//  GameScout
//
//  Created by Rubens Inaba on 11/3/23.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var vm = NewUserViewImpl (service: NewUserServiceImpl())
//    Change Navigation Bar Color
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    var body: some View {
        NavigationView {
                ZStack {
                    Color("theme").edgesIgnoringSafeArea(.all)
                    VStack(spacing: 32) {
                        VStack(spacing: 16) {
                            TextInputView(text: $vm.userDetails.email,
                                          placeholder: "Email",
                                          keyboardType: .emailAddress,
                                          sfSymbol: "envelope")
                                          .disableAutocorrection(true)
                                          .autocapitalization(.none)
                            
                            PasswordInputView(password: $vm.userDetails.password,
                                              placeholder: "Password",
                                              sfSymbol: "lock")
                                              .disableAutocorrection(true)
                                              .autocapitalization(.none)
                            
                            Divider().background(.black)
                            
                            TextInputView(text: $vm.userDetails.firstName,
                                          placeholder: "First Name",
                                          keyboardType: .namePhonePad,
                                          sfSymbol: "f.square")
                            
                            TextInputView(text: $vm.userDetails.lastName,
                                          placeholder: "Last Name",
                                          keyboardType: .namePhonePad,
                                          sfSymbol: "l.square")
                            
                            TextInputView(text: $vm.userDetails.username, placeholder: "Username", keyboardType: .namePhonePad, sfSymbol: "person")
                        }
                        ButtonView(title: "Get Started") {
                            vm.register()
                        }
                    }.padding(.horizontal, 15)
                }.navigationTitle("Register")
                    .applyClose()
                    .alert(isPresented: $vm.hasError,
                           content: {
                        if case .failed(let error) = vm.state {
                            return Alert(title: Text("Error"),
                                         message: Text(error.localizedDescription))
                        } else {
                            return Alert(title: Text("Error"),
                                         message: Text("Something went wrong"))
                        }
                    })
            }
    }
}

//#Preview {
//    SignUpView()
//}
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

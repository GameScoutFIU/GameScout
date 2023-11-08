//
//  ChangeAvatarView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/7/23.
//

import SwiftUI

struct ChangeAvatarView: View {
//    @Environment(\.presentationMode) var presentationMode
//    var selectedAvatar = 
    @State var selectedAvatar = "Avatar1"
    var Avatars = ["Avatar1","Avatar2","Avatar3","Avatar4","Avatar5","Avatar6","Avatar7","Avatar8"]
    var body: some View {
        ZStack {
            Color("theme").edgesIgnoringSafeArea(.all)
            VStack (alignment: .center, spacing: 30){
                Text("Choose Your Avatar")
                    .foregroundColor(.white)
                    .padding(.leading)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                
                Image(selectedAvatar)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 1), count: 4), spacing: 20) {
                    ForEach(Avatars, id: \.self) { avatar in
                        let borderWidth = avatar == selectedAvatar ? 3.0 : 0.0
                        Button {
                            selectedAvatar = avatar
                        } label: {
                            Image(avatar)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                .overlay(Circle().stroke(lineWidth: borderWidth))
                        }
                    }
                }
                
                ButtonView(title: "Change Profile Photo") {
//                    vm.sendPasswordReset()
//                    showAlert.toggle()
                }.padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    ChangeAvatarView()
}

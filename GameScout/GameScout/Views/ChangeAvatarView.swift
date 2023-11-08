//
//  ChangeAvatarView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/7/23.
//

import SwiftUI

struct ChangeAvatarView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var sessionService: SessionServiceImpl
    @State var avatarDBID: String
    var Avatars = ["Avatar1","Avatar2","Avatar3","Avatar4","Avatar5","Avatar6","Avatar7","Avatar8"]
    @State private var showAlert = false
    var body: some View {
        ZStack {
            Color("theme").edgesIgnoringSafeArea(.all)
            if (showAlert == false) {
                VStack (alignment: .center, spacing: 30){
                    Text("Choose Your Avatar")
                        .foregroundColor(.white)
                        .padding(.leading)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    
                    Image(avatarDBID)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 1), count: 4), spacing: 20) {
                        ForEach(Avatars, id: \.self) { avatar in
                            let borderWidth = avatar == avatarDBID ? 3.0 : 0.0
                            Button {
                                avatarDBID = avatar
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
                        sessionService.updateAvatar(avatarID: avatarDBID)
                        showAlert.toggle()
                    }.padding(.horizontal, 16)
                }
            } else {
                SuccessUpdateView(message: "Avatar Updated!")
            }
        }
    }
}

#Preview {
    ChangeAvatarView(avatarDBID: "Avatar1")
}

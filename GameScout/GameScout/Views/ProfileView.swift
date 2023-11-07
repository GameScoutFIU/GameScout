//
//  ProfileView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/5/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    @State private var showResetView = false
    var body: some View {
        ZStack {
            Color("theme").edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                    .frame(height: 40)
                
                //User Info Tab
                HStack {
                    //Avatar Image
                    Image("placeholder")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .padding(.leading)
                    
                    //Username
                    Text("\(sessionService.userDetails?.username ?? "Username N/A")")
                        .foregroundColor(.white)
                    Spacer()
                }
                Divider()
                    .background(Color.white)
                    .padding(10)
                //User Change Avatar Tab
                VStack (alignment: .leading) {
                    Text("Change Avatar")
                        .foregroundColor(.white)
                        .padding(.leading)
                    Divider()
                        .background(Color.white)
                        .padding(10)
                }
                //User Change Password Tab
                VStack (alignment: .leading) {
                    Button {
                        showResetView.toggle()
                    } label: {
                        Text("Change Password")
                            .foregroundColor(.white)
                            .padding(.leading)
                    }.sheet(isPresented: $showResetView) {
                        PasswordResetView()
                    }
                    Divider()
                        .background(Color.white)
                        .padding(10)
                }
                //User Logout Tab
                VStack (alignment: .leading) {
                    Button {
                        sessionService.logout()
                    } label: {
                        Text("Logout")
                            .foregroundStyle(.white)
                            .padding(.leading)
                    }
                    Divider()
                        .background(Color.white)
                        .padding(10)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ProfileView().environmentObject(SessionServiceImpl())
}

//
//  HomeView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/3/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var sessionService: SessionServiceImpl
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        ZStack {
            Color("theme").edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading, spacing: 16) {
                VStack(alignment: .leading, spacing: 16) {
                    Text("First Name: \(sessionService.userDetails?.firstName ?? "N/A")")
                       .foregroundColor(.white)
                    Text("Last Name: \(sessionService.userDetails?.lastName ?? "N/A")")
                        .foregroundColor(.white)
                    Text("Username: \(sessionService.userDetails?.username ?? "N/A")")
                        .foregroundColor(.white)
                }
                
                ButtonView(title: "Logout") {
                    sessionService.logout()
                }
            }.padding(.horizontal, 16)
        }.navigationTitle("Home")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView().environmentObject(SessionServiceImpl())
        }
    }
}

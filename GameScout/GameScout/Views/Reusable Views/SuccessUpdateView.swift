//
//  SuccessUpdateView.swift
//  GameScout
//
//  Created by Erick Rivera on 11/8/23.
//

import SwiftUI

struct SuccessUpdateView: View {
    var message: String
    var body: some View {
        VStack {
            Image(systemName: "checkmark.circle")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.white)
            Text(message)
                .foregroundColor(.white)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

//#Preview {
//    SuccessUpdateView(message: "Success").background(Color("theme"))
//}

struct SuccessUpdateView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessUpdateView(message: "Success").background(Color("theme"))
    }
}

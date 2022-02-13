//
//  LoginView.swift
//  Sample2
//
//  Created by Adrian Mateoaea on 12.02.2022.
//

import SwiftUI

struct LoginView: View {
    var coordinator: AuthCoordinator?
    
    var body: some View {
        VStack {
            Text("Login")
            Button("Login") {
                coordinator?.goToHome()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

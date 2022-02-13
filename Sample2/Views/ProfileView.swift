//
//  ProfileView.swift
//  Sample2
//
//  Created by Adrian Mateoaea on 12.02.2022.
//

import SwiftUI

struct ProfileView: View {
    var coordinator: ViewCoordinator?
    
    var body: some View {
        VStack {
            Text("Profile")
            Button("Feed") {
                coordinator?.goToFeed()
            }
            Button("Comments") {
                coordinator?.goToComments()
            }
        }
        .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

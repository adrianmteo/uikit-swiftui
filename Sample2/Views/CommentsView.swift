//
//  CommentsView.swift
//  Sample2
//
//  Created by Adrian Mateoaea on 12.02.2022.
//

import SwiftUI

struct CommentsView: View {
    var coordinator: ViewCoordinator?
    
    var body: some View {
        VStack {
            Text("Comments")
            Button("Profile") {
                coordinator?.goToProfile()
            }
        }
        .navigationTitle("Comments")
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView()
    }
}

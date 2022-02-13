//
//  CameraView.swift
//  Sample2
//
//  Created by Adrian Mateoaea on 12.02.2022.
//

import SwiftUI

struct CameraView: View {
    var coordinator: HomeCoordinator?
    
    var body: some View {
        VStack {
            Text("Camera")
            Button("Back") {
                coordinator?.goBack()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .statusBar(hidden: true)
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

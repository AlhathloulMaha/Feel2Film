//
//  LoadingView.swift
//  MyMovie
//
//  Created by Maha Alhathloul on 23/11/1443 AH.
//

import SwiftUI
import SceneKit

struct LoadingView: View {
    
    @State private var degrees: Double = 0.0
    var body: some View {
        ZStack {
            Color.backGround
                .ignoresSafeArea()
            
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .rectangleColor))
                            .scaleEffect(2)
            
            
        }
        
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

//
//  RotationTransition.swift
//  CustomTransitions
//
//  Created by Delstun McCray on 8/16/23.
//

import SwiftUI

struct RotationTransitionExample: View {
    @State private var rotate = false
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(rotate ? 90 : 0))
                .animation(.easeInOut(duration: 1.0))
            
            Button("Rotate") {
                rotate.toggle()
            }
            .frame(width: 150, height: 40)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()
        }
    }
}


#Preview {
    RotationTransitionExample()
}

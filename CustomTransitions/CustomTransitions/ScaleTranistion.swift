//
//  ScaleTranistion.swift
//  CustomTransitions
//
//  Created by Delstun McCray on 8/16/23.
//

import SwiftUI

struct ScaleTranistion: View {
    @State private var isScaled = false

    var body: some View {
        NavigationView {
            VStack {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: isScaled ? UIScreen.main.bounds.width : 100, height: isScaled ? UIScreen.main.bounds.height : 100)
                    .animation(.spring(response: 0.5, dampingFraction: 0.7))

                NavigationLink(destination: DetailView(), isActive: $isScaled) {
                    EmptyView()
                }
                .opacity(0)
                
                Button("Scale and Navigate") {
                    withAnimation {
                        isScaled.toggle()
                    }
                }
                .frame(width: 150, height: 40)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding()
            }
            .navigationBarTitle("Main Screen")
        }
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail View")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
        }
    }
}


#Preview {
    ScaleTranistion()
}

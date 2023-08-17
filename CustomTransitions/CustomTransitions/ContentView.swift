//
//  ContentView.swift
//  CustomTransitions
//
//  Created by Delstun McCray on 8/16/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isFlipped = false
    @State private var showNextView = false
    @Namespace private var namespace

    var body: some View {
        VStack(spacing: 20) {
            RotationTransitionExample()
            ScaleTranistion()
            Button(showNextView ? "Hide Next View" : "Show Next View") {
                withAnimation {
                    showNextView.toggle()
                }
            }
            .frame(width: 200, height: 40)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()

            ZStack {
                if showNextView {
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: 150, height: 150)
                        .matchedGeometryEffect(id: "greenRectangle", in: namespace)
                }
            }
            .padding(.bottom, 42)

            ZStack {
                Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .rotation3DEffect(.degrees(isFlipped ? 180 : 0), axis: (x: 0, y: 1, z: 0))
                    .offset(y: isFlipped ? -50 : 50)
                    .opacity(isFlipped ? 1 : 0)

                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                    .rotation3DEffect(.degrees(isFlipped ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                    .offset(y: isFlipped ? 50 : -50)
                    .opacity(isFlipped ? 0 : 1)
            }
            
            Button("Coin Flip Transition") {
                withAnimation(.easeInOut(duration: 1.0)) {
                    isFlipped.toggle()
                }
            }
            .frame(width: 200, height: 40)
            .background(Color.purple)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()
        }
    }
}



#Preview {
    ContentView()
}

struct SlideTransitionModifier: ViewModifier {
    var offset: CGSize
    
    func body(content: Content) -> some View {
        content
            .offset(offset)
    }
}

extension AnyTransition {
    static var slideIn: AnyTransition {
        let insertion = AnyTransition.modifier(
            active: SlideTransitionModifier(offset: CGSize(width: UIScreen.main.bounds.width, height: 0)),
            identity: SlideTransitionModifier(offset: .zero)
        )
        let removal = AnyTransition.modifier(
            active: SlideTransitionModifier(offset: .zero),
            identity: SlideTransitionModifier(offset: CGSize(width: -UIScreen.main.bounds.width, height: 0))
        )
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct FlipTransition: ViewModifier {
    @Binding var flipped: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if flipped {
                content
                    .rotationEffect(.degrees(180))
                    .opacity(0)
            } else {
                content
            }
        }
    }
}

extension View {
    func flipTransition(flipped: Binding<Bool>) -> some View {
        self.modifier(FlipTransition(flipped: flipped))
    }
}


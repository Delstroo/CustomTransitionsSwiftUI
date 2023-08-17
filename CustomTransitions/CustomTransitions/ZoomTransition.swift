//
//  ZoomTransition.swift
//  CustomTransitions
//
//  Created by Delstun McCray on 8/17/23.
//

import SwiftUI

struct ZoomTransition: View {
    @State var tapped = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            // From
            if !tapped {
                InitialView(tapped: $tapped, namespace: namespace)
            } else {
                SecondView(tapped: $tapped, namespace: namespace)
            }
        }
    }
}

struct InitialView: View {
    @Binding var tapped: Bool
    var namespace: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image("hamburger")
                .resizable()
                .frame(width: 300, height: 150)
                .aspectRatio(contentMode: .fit)
                .padding()
                .matchedGeometryEffect(id: "image", in: namespace)
                .padding(.top, -16)

            Text("SwiftUI")
                .font(.title).bold()
                .padding()
                .matchedGeometryEffect(id: "title", in: namespace)
            
            Text("Today I ate a burger that was being eaten by a dog.")
                .font(.title2).fontWeight(.medium)
                .padding(2)
                .matchedGeometryEffect(id: "title2", in: namespace)
            
            Text("Today I ate a burger that was being eaten by a dog.")
                .font(.footnote).fontWeight(.regular)
                .padding()
                .matchedGeometryEffect(id: "title3", in: namespace)
        }
        .frame(width: 300)
        .background(Color(.systemPurple))
        .cornerRadius(20)
        .shadow(color: Color(.secondaryLabel), radius: 12, x: 0, y: 5)
        .matchedGeometryEffect(id: "card", in: namespace)
        .onTapGesture {
            withAnimation {
                tapped.toggle()
            }
        }
    }
}

struct SecondView: View {
    @Binding var tapped: Bool
    var namespace: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Image("hamburger")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 300)
                .padding()
                .matchedGeometryEffect(id: "image", in: namespace)
                .aspectRatio(contentMode: .fit)
                .padding(.top, -16)
        
            Text("SwiftUI")
                .font(.title).bold()
                .padding()
//                .matchedGeometryEffect(id: "title", in: namespace)
            
            Text("Today I ate a burger that was being eaten by a dog.")
                .font(.title2).fontWeight(.medium)
                .padding()
//                .matchedGeometryEffect(id: "title2", in: namespace)
            
            Text("Lupton (Navajo: Tsé Siʼání) is an unincorporated community and census-designated place (CDP) in Apache County, Arizona, United States. Lupton is located along Interstate 40 at the New Mexico border, 21 miles (34 km) southwest of Gallup, New Mexico. Lupton has a post office with ZIP code 86508.[2] As of the 2010 census, the Lupton CDP had a population of 25.[3]Lupton (Navajo: Tsé Siʼání) is an unincorporated community and census-designated place (CDP) in Apache County, Arizona, United States. Lupton is located along Interstate 40 at the New Mexico border, 21 miles (34 km) southwest of Gallup, New Mexico. Lupton has a post office with ZIP code 86508.[2] As of the 2010 census, the Lupton CDP had a population of 25.[3]Lupton (Navajo: Tsé Siʼání) is an unincorporated community and census-designated place (CDP) in Apache County, Arizona, United States. Lupton is located along Interstate 40 at the New Mexico border, 21 miles (34 km) southwest of Gallup, New Mexico. Lupton has a post office with ZIP code 86508.[2] As of the 2010 census, the Lupton CDP had a population of 25.[3]")
                .font(.footnote).fontWeight(.regular)
                .padding()
//                .matchedGeometryEffect(id: "title3", in: namespace)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .ignoresSafeArea()
        .background(Color(.systemPurple))
        .cornerRadius(20)
        .shadow(color: Color(.secondaryLabel), radius: 12, x: 0, y: 5)
        .matchedGeometryEffect(id: "card", in: namespace)
        .onTapGesture {
            withAnimation {
                tapped.toggle()
            }
        }
    }
}

#Preview {
    ZoomTransition()
}

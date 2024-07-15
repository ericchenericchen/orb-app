//
//  RegisterView.swift
//  Orbit
//
//  Created by Eric Chen on 7/15/24.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        ZStack{
            Color.bgBlue

            ZStack{
                Text("orbit")
                    .foregroundColor(.white)
                    .font(.custom("HelveticaNeue", size: 55))
            }.offset(x: 0, y: -UIScreen.main.bounds.height/6)
            
            //image test
            ZStack{
                // Glow effect
                Circle()
                    .fill(Color.bgGlow)
                    .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.width * 1.5)
                    .blur(radius: 120) // Adjust the blur radius as needed
                    .opacity(0.75) // Adjust the opacity as needed
                
                Image("OrbitIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.width * 1.5)
            }
            .offset(x: 0, y: UIScreen.main.bounds.height / 3)
        }.edgesIgnoringSafeArea(.all)

    }
}

#Preview {
    RegisterView()
}

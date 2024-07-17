//
//  AnimationTestView.swift
//  Orbit
//
//  Created by Eric Chen on 7/17/24.
//

import SwiftUI

struct AnimationTestView: View {
    @State private var isAnimated = false

    var body: some View {
        VStack {
            Spacer()

            // Image test with glow effect
            ZStack {
                // Glow effect
                Circle()
                    .fill(Color.white)
                    .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.width * 1)
                    .blur(radius: 50) // Adjust the blur radius as needed
                    .opacity(0.5) // Adjust the opacity as needed
                
                // Orbit icon
                Image("OrbitIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: isAnimated ? UIScreen.main.bounds.width * 0.75: UIScreen.main.bounds.width * 1.5,
                           height: isAnimated ? UIScreen.main.bounds.width * 0.75 : UIScreen.main.bounds.width * 1.5)
            }
            .offset(y: isAnimated ? 0 : UIScreen.main.bounds.height / 2)
            .animation(.easeInOut(duration: 2), value: isAnimated)

            Spacer()

            // Button to trigger the animation
            Button(action: {
                withAnimation {
                    isAnimated.toggle()
                }
            }) {
                Text("Animate")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    AnimationTestView()
}

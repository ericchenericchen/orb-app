//
//  Loading.swift
//  Orbit
//
//  Created by Eric Chen on 7/17/24.
//

import SwiftUI

struct LoadingView: View {
    @State private var animationState1 = false //logo animation
    @State private var animationState2 = false //text animation
    @State private var animationState3 = false //getStarted animation
    @Binding var showRegister: Bool

    var body: some View {
        ZStack{
            Color.bgBlue
            
            ZStack{
                Text("orbit")
                    .foregroundColor(.white)
                    .font(.custom("HelveticaNeue", size: 55))
                    .opacity(animationState1 ? 0 : 1)
            }.offset(x: 0, y: -UIScreen.main.bounds.height/6)
                .animation(.easeInOut(duration: 1.5), value: animationState1)
            
            //image test
            ZStack{
                // Glow effect
                Circle()
                    .fill(Color.bgGlow)
                    .frame(width: UIScreen.main.bounds.width * (animationState1 && !animationState3 ? 1 : 1.5), height: UIScreen.main.bounds.width * (animationState1 && !animationState3 ? 1 : 1.5))
                    .blur(radius: 120) // Adjust the blur radius as needed
                    .opacity(0.75) // Adjust the opacity as needed
                
                Image("OrbitIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * (animationState1 && !animationState3 ? 0.75 : 1.5), height: UIScreen.main.bounds.width * (animationState1 && !animationState3 ? 0.75 : 1.5))
                    .rotationEffect( Angle.degrees(animationState3 ? -360 : animationState1 ? 0 : -180), anchor: .center)
                    .blur(radius: animationState3 ? 100 : 0)
                
//                Circle()
//                    .fill(Color.red)
//                    .frame(width: 10, height: 10)
            }
            .offset(x: animationState3 ? UIScreen.main.bounds.width / 2 : 0, y: animationState1 ? 0 : UIScreen.main.bounds.height / 3)
            .animation(.easeInOut(duration: 2), value: animationState1)
            .animation(.easeInOut(duration: 2), value: animationState3)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        animationState1.toggle()
                    }
                }
            }
            
            ZStack{
                Button(action: {
                    if(animationState2){
                        animationState2.toggle()
                        animationState3.toggle()
//                        animationState1.toggle()
                        showRegister.toggle()

                    }
                }){
                    Text("let's get started")
                        .foregroundColor(.white)
                        .font(.custom("HelveticaNeue", size: 30))
                        .opacity(animationState2 ? 1 : 0)
                }
                .offset(x: 0, y: UIScreen.main.bounds.height/3)
                .animation(.easeInOut(duration: 2), value: animationState2)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation {
                            animationState2.toggle()
                        }
                    }
                }
            }
            
        }.edgesIgnoringSafeArea(.all)
//            .fullScreenCover(isPresented: $showRegister) {
//                RegisterView(showRegister)
//            }
    }

}

#Preview {
    LoadingView(showRegister: .constant(false))
}

//
//  Loading.swift
//  Orbit
//
//  Created by Eric Chen on 7/17/24.
//

import SwiftUI

struct LoadingView: View {
    @State private var isAnimated = false
    @State private var textAnimated = false

    var body: some View {
        ZStack{
            Color.bgBlue
            
            ZStack{
                Text("orbit")
                    .foregroundColor(.white)
                    .font(.custom("HelveticaNeue", size: 55))
                    .opacity(isAnimated ? 0 : 1)
            }.offset(x: 0, y: -UIScreen.main.bounds.height/6)
                .animation(.easeInOut(duration: 1.5), value: isAnimated)
            
            //image test
            ZStack{
                // Glow effect
                Circle()
                    .fill(Color.bgGlow)
                    .frame(width: UIScreen.main.bounds.width * (isAnimated ? 1 : 1.5), height: UIScreen.main.bounds.width * (isAnimated ? 1 : 1.5))
                    .blur(radius: 120) // Adjust the blur radius as needed
                    .opacity(0.75) // Adjust the opacity as needed
                
                Image("OrbitIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * (isAnimated ? 0.75 : 1.5), height: UIScreen.main.bounds.width * (isAnimated ? 0.75 : 1.5))
                    .rotationEffect( Angle.degrees(isAnimated ? 0 : -180), anchor: .center)
                
//                Circle()
//                    .fill(Color.red)
//                    .frame(width: 10, height: 10)
            }
            .offset(x: 0, y: isAnimated ? 0 : UIScreen.main.bounds.height / 3)
            .animation(.easeInOut(duration: 2), value: isAnimated)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isAnimated.toggle()
                    }
                }
            }
            
            ZStack{
                Button(action: {
                    if(textAnimated){
                        textAnimated.toggle()
                        isAnimated.toggle()
                    }
                }){
                    Text("let's get started")
                        .foregroundColor(.white)
                        .font(.custom("HelveticaNeue", size: 30))
                        .opacity(textAnimated ? 1 : 0)
                }
                .offset(x: 0, y: UIScreen.main.bounds.height/3)
                .animation(.easeInOut(duration: 2), value: textAnimated)
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation {
                            textAnimated.toggle()
                        }
                    }
                }
            }
            
        }.edgesIgnoringSafeArea(.all)
    }

}

#Preview {
    LoadingView()
}

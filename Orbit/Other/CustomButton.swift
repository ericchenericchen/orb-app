//
//  CustomButton.swift
//  Orbit
//
//  Created by Eric Chen on 8/13/24.
//

import Foundation
import SwiftUI

/**
 Custom Button template, use example:
 
        CustomButton(
            title: "Continue with Google",
            backgroundColor: Color.bgGlow,
            action: {
                showRegister.toggle()
            }
        )
 
 Can customize widthRatio and HeightRatio too as proportions to iPhone15 display
 */

struct CustomButton: View {
    var title: String
    var widthRatio: CGFloat = 327/430
    var heightRatio: CGFloat = 45/932
    var foregroundColor: Color = Color.bgBlue
    var backgroundColor: Color = Color.bgLightBlue
    var cornerRadius: CGFloat = 15
    var action: () -> Void

    var body: some View {
        Button(action: {
            withAnimation {
                action()
            }
        }) {
            Text(title)
                .foregroundColor(foregroundColor)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(backgroundColor)
                )
                .frame(
                    width: UIScreen.main.bounds.width * widthRatio,
                    height: UIScreen.main.bounds.height * heightRatio
                )
        }
    }
}

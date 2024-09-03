//
//  CustomTextField.swift
//  Orbit
//
//  Created by Eric Chen on 8/16/24.
//

import Foundation
import SwiftUI

struct CustomInputField: View {
    var placeholder: String
    @Binding var text: String
    var widthRatio: CGFloat = 327/430
    var heightRatio: CGFloat = 45/932
    var cornerRadius: CGFloat = 15
    var borderColor: Color = Color.bgLightGrey
    var backgroundColor: Color = Color.white
    var protected: Bool = false //password protected

    var body: some View {
        if(protected){
            SecureField(placeholder, text: $text)
                .padding()
                .frame(
                    width: UIScreen.main.bounds.width * widthRatio,
                    height: UIScreen.main.bounds.height * heightRatio
                )
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(backgroundColor)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: 1)
                )
                .autocapitalization(.none) // Example of additional customization
                .disableAutocorrection(true)
        }
        else{
            TextField(placeholder, text: $text)
                .padding()
                .frame(
                    width: UIScreen.main.bounds.width * widthRatio,
                    height: UIScreen.main.bounds.height * heightRatio
                )
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(backgroundColor)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: 1)
                )
                .autocapitalization(.none) // Example of additional customization
                .disableAutocorrection(true)
        }
    }
}

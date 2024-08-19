//
//  AddItemView.swift
//  Orbit
//
//  Created by Gabe Sianipar on 01/08/24.
//

import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

struct AddOrbView: View {
    @Binding var newLabelText: String
    @Binding var newLabelTitle: String
    var addItemAction: () -> Void
    @State var isViewVisible: Bool = true

    var body: some View {
        ZStack (alignment: .bottom) {
            if isViewVisible {
                LinearGradient(
                    stops: [
                    Gradient.Stop(color: Color(red: 0.09, green: 0.15, blue: 0.26), location: 0.00),
                    Gradient.Stop(color: .white.opacity(0), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 0.39),
                    endPoint: UnitPoint(x: 0.5, y: 1.34)
                )
                .frame(width: UIScreen.screenWidth, height: 700)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                    .stroke(Color(red: 0.51, green: 0.74, blue: 0.99), lineWidth: 1)
                )
                .overlay(
                    Button(action: {
                        isViewVisible.toggle()
                    }) {
                        Image("Group 56")
                        .padding(.trailing, 10)
                        .padding(.top, 13)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 10),
                    alignment: .topTrailing
                )
                
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Create a new")
                        .font(.custom("Helvetica Neue", size: 30))
                        .foregroundColor(Color.bgLightBlue)
                        .padding(.top, 68)
                        .padding(.leading, 35)
                    HStack{
                        ZStack{
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 9, height: 9)
                                .cornerRadius(45)
                                .overlay(
                                RoundedRectangle(cornerRadius: 45)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.51, green: 0.74, blue: 0.99), lineWidth: 1)
                            )
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 19, height: 19)
                                .cornerRadius(45)
                                .overlay(
                                RoundedRectangle(cornerRadius: 45)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.51, green: 0.74, blue: 0.99), lineWidth: 1)
                            )
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 27, height: 27)
                                .cornerRadius(45)
                                .overlay(
                                RoundedRectangle(cornerRadius: 45)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.51, green: 0.74, blue: 0.99), lineWidth: 1)

                            )
                            
                        }
                        
                        Text("Orb")
                            .font(.custom("Helvetica Neue", size: 30))
                            .foregroundColor(Color.bgLightBlue)
                            
                        
                    }
                    .padding(.leading, 35)
                    .padding(.bottom, 21)
                    

                    
                    ZStack {
                        Image("Rectangle 19")
                            .resizable()
                            .frame(width: 380, height: 170)
                            .background(Color(red: 0.51, green: 0.74, blue: 0.99).opacity(0.25))
                            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 2)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        VStack {
                            CustomTextField(
                                placeholder: "Title",
                                text: $newLabelTitle,
                                font: UIFont(name: "Helvetica Neue", size: 16)!,
                                placeholderColor: UIColor.white.withAlphaComponent(0.5),
                                fontWeight: .bold
                                )
                            .padding()
                            .padding(.top, 17)
                            .padding(.bottom, 11)
                            
                                
                            .frame(height: 35)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding(.horizontal, 16)
                            
                            Divider()
                                .frame(width: 380, height: 1)
                                    .background(Color.gray.opacity(0.5))
                            
                            CustomTextField(
                                placeholder: "What's on your mind?",
                                text: $newLabelText,
                                font: UIFont(name: "Helvetica Neue", size: 16)!,
                                placeholderColor: UIColor.white.withAlphaComponent(0.5)
                                )
                            .padding()
                                .frame(height: 110)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .padding(.horizontal, 16)
                                

                        
                        }

                       
                    }
                    .frame(width: 400, height: 161)
                    .padding(.bottom, 31)
                    
                    HStack {
                        Spacer()
                        
                        Text("Remind me again ")
                        .font(
                        Font.custom("Helvetica Neue", size: 15)
                        .weight(.light)
                        )
                        .foregroundColor(Color(red: 0.51, green: 0.74, blue: 0.99))
                        
                        
                        Button(action: {
                        }) {
                            HStack {
                                Text("Today")
                                    .font(.custom("Helvetica Neue", size: 14))
                                    .foregroundColor(Color(red: 0.51, green: 0.74, blue: 0.99))
                            }
                            .frame(width: 100, height: 30)
                            .background(Color(red: 0.91, green: 0.91, blue: 0.92).opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(red: 0.51, green: 0.74, blue: 0.99), lineWidth: 1)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        
                        Text("@")
                        .font(
                        Font.custom("Helvetica Neue", size: 15)
                        .weight(.light)
                        )
                        .foregroundColor(Color(red: 0.51, green: 0.74, blue: 0.99))
                        
                        
                        Button(action: {
                        }) {
                            HStack {
                                Text("10 PM")
                                    .font(.custom("Helvetica Neue", size: 14))
                                    .foregroundColor(Color(red: 0.51, green: 0.74, blue: 0.99))
                            }
                            .frame(width: 100, height: 30)
                            .background(Color(red: 0.91, green: 0.91, blue: 0.92).opacity(0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color(red: 0.51, green: 0.74, blue: 0.99), lineWidth: 1)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        }
                        
                        
                        
                        Spacer()
                        
                        
                    }
                    .padding(.bottom, 25)
                    
                    HStack {
                        Spacer()
                        ZStack{
                            Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 380, height: 61)
                            .background(Color(red: 0.51, green: 0.74, blue: 0.99).opacity(0.1))

                            .cornerRadius(15)
                            
                            HStack {
                                       Spacer()
                                       
                                       Button(action: {
                                           print("White ellipse tapped")
                                       }) {
                                           Ellipse()
                                               .fill(Color.white)
                                               .frame(width: 23, height: 23)
                                       }
                                       
                                       Spacer()
                                       
                                       Button(action: {
                                           print("Yellow ellipse tapped")
                                       }) {
                                           Ellipse()
                                               .fill(Color(red: 1, green: 0.93, blue: 0.33))
                                               .frame(width: 23, height: 23)
                                       }
                                       
                                       Spacer()
                                       
                                       Button(action: {
                                           print("Green ellipse tapped")
                                       }) {
                                           Ellipse()
                                               .fill(Color(red: 0.71, green: 0.87, blue: 0.59))
                                               .frame(width: 23, height: 23)
                                       }
                                       
                                       Spacer()
                                       
                                       Button(action: {
                                           print("Blue ellipse tapped")
                                       }) {
                                           Ellipse()
                                               .fill(Color(red: 0.4, green: 0.7, blue: 0.81))
                                               .frame(width: 23, height: 23)
                                       }
                                       
                                       Spacer()
                                       
                                       Button(action: {
                                           print("Purple ellipse tapped")
                                       }) {
                                           Ellipse()
                                               .fill(Color(red: 0.59, green: 0.56, blue: 0.93))
                                               .frame(width: 23, height: 23)
                                       }
                                       
                                       Spacer()
                                       
                                       Button(action: {
                                           print("Pink ellipse tapped")
                                       }) {
                                           Ellipse()
                                               .fill(Color(red: 0.9, green: 0.55, blue: 0.87))
                                               .frame(width: 23, height: 23)
                                       }
                                       
                                       Spacer()
                                       
                                       Button(action: {
                                           print("Orange ellipse tapped")
                                       }) {
                                           Ellipse()
                                               .fill(Color(red: 1, green: 0.6, blue: 0.32))
                                               .frame(width: 23, height: 23)
                                       }
                                       Spacer()
                                   }
                        }
                        Spacer()
                    }
                    .padding(.bottom, 30)
                    
                
                    HStack {
                        Spacer()
                        Button(action: addItemAction) {
                            Text("Create")
                                .font(.custom("Helvetica Neue", size: 12))
                        }
                        .buttonStyle(CustomButtonStyle())
                        .overlay(
                        RoundedRectangle(cornerRadius: 25)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.51, green: 0.74, blue: 0.99), lineWidth: 1)

                        )
                        Spacer()
                    }
                    .padding(.top)
                    Spacer()

                }
                .padding(.horizontal)
                
                
                
            }
            else {
                Button(action: {
                    isViewVisible.toggle()
                }) {
                    Text(isViewVisible ? "" : "Add Orb")
                        .foregroundColor(.white)
                        .cornerRadius(2)
                        .font(.custom("Helvetica Neue", size: 12))
                }
                .buttonStyle(AddViewButtonStyle())
            }
        }
        
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 155, height: 40)
            .background(Color.bgBlue)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

struct AddViewButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(width: 155, height: 40)
            .background(Color.gray)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

struct CustomTextField: UIViewRepresentable {
    var placeholder: String
    @Binding var text: String
    var font: UIFont
    var placeholderColor: UIColor
    var fontWeight: UIFont.Weight = .regular

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: font.pointSize, weight: fontWeight) // Apply the font weight
        textField.textColor = UIColor.white
        textField.backgroundColor = UIColor.clear
        textField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
        textField.delegate = context.coordinator
        

        textField.textAlignment = .left
        textField.contentVerticalAlignment = .top
        
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
        uiView.font = UIFont.systemFont(ofSize: font.pointSize, weight: fontWeight) // Ensure the font weight is applied during updates
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: CustomTextField

        init(_ parent: CustomTextField) {
            self.parent = parent
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            parent.text = textField.text ?? ""
        }
    }
}

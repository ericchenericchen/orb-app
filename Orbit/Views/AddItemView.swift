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

struct AddItemView: View {
    @Binding var newLabelText: String
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
                .frame(width: UIScreen.screenWidth, height: 450)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                    .stroke(Color(red: 0.51, green: 0.74, blue: 0.99), lineWidth: 1)
                )
                .overlay(
                    Button(action: {
                        isViewVisible.toggle()
                    }) {
                        Text(isViewVisible ? "X" : "")
                            .foregroundColor(.bgLightBlue)
                            .font(.title)
                            .padding(.trailing, 10)
                            .padding(.top, 13)
                    }
                    .padding(.trailing, 20)
                    .padding(.top, 10),
                    alignment: .topTrailing
                )
                
                
                VStack(alignment: .leading) {
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Create a new Orb!")
                        .font(.custom("Helvetica Neue", size: 30))
                        .foregroundColor(Color.bgLightBlue)
                        .padding()
                    
                    TextField("What's on your mind?", text: $newLabelText)
                        .font(.custom("Helvetica Neue", size: 12))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .onSubmit(addItemAction)
                        .padding()
                    
                    
                    HStack {
                        Spacer()
                        Button(action: addItemAction) {
                            Text("Create")
                                .font(.custom("Helvetica Neue", size: 12))
                        }
                        .buttonStyle(CustomButtonStyle())
                        Spacer()
                    }
                    .padding(.top)

                    Spacer()
                }
                .padding()
                
                
                
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



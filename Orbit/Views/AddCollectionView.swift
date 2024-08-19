//
//  AddCollectionView.swift
//  Orbit
//
//  Created by Gabe Sianipar on 19/08/24.
//

import SwiftUI


struct AddCollectionView: View {
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
                        .padding(.leading, 35)
                        .padding(.top, 68)
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
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 27, height: 27)
                                .cornerRadius(5)
                                .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.51, green: 0.74, blue: 0.99), lineWidth: 1)

                            )
                            
                        }

                        
                        Text("Collection")
                            .font(.custom("Helvetica Neue", size: 30))
                            .foregroundColor(Color.bgLightBlue)
                            
                        
                    }
                    .padding(.top, 0)
                    .padding(.leading, 35)
                    .padding(.bottom, 34)
                
                    
                    ZStack {
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 380, height: 52)
                        .background(Color(red: 0.51, green: 0.74, blue: 0.99).opacity(0.25))

                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 2)
                        
                        VStack {
                            CustomTextField(
                                placeholder: "Give your collection a name",
                                text: $newLabelTitle,
                                font: UIFont(name: "Helvetica Neue", size: 16)!,
                                placeholderColor: UIColor.white.withAlphaComponent(0.5)
                                )
                            .padding()
                            
                                .frame(height: 35)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .padding(.horizontal, 16)
                        }
                    }
                    .frame(width: 400, height: 52)
                    .padding(.bottom, 31)
                    
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

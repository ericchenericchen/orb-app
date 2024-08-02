//
//  AddItemView.swift
//  Orbit
//
//  Created by Gabe Sianipar on 01/08/24.
//

import SwiftUI

struct AddItemView: View {
    @Binding var newLabelText: String
    var addItemAction: () -> Void

    var body: some View {
        ZStack {
            // Linear Gradient Background
            LinearGradient(
                gradient: Gradient(colors: [Color.bgLightBlue, Color.bgLightGrey]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                // Make sure List takes full width
                List {
                    Section(header: headerView) {
                        TextField("What's on your mind?", text: $newLabelText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .onSubmit(addItemAction)
                        Button(action: addItemAction) {
                            Text("Create")
                        }
                    }
                    
                }
                .cornerRadius(8)
                
                
            }
            .padding()
            
        }
    }

    // Custom header view with linear gradient background
    private var headerView: some View {
        Text("Create a new Orb!")
            .foregroundColor(Color.bgLightBlue) // Set text color
            .padding()
            .cornerRadius(8) // Optional: round the corners
    }
}

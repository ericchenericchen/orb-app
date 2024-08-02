//
//  ContentView.swift
//  Orbit
//
//  Created by Eric Chen on 7/15/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var showRegister = false

    var body: some View {
        ZStack {
            LoadingView(showRegister: $showRegister)

            if showRegister {
                RegisterView(showRegister: $showRegister)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut(duration: 1), value: showRegister) // Adjust the duration as needed
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

import SwiftUI

struct RegisterView: View {
    @Binding var showRegister: Bool

    var body: some View {
        ZStack {
            Color.clear
                .edgesIgnoringSafeArea(.all)

            VStack {
                LinearGradient(gradient: Gradient(colors: [Color.white, .gradientBlack]),
                               startPoint: .top,
                               endPoint: .bottom)
                    .opacity(0.4)
                    .overlay(
                        // Example content
                        VStack {
                            Text("Hello world!")
                                .foregroundColor(.black)
                            
                            Button(action: {
                                withAnimation {
                                    showRegister.toggle()
                                }
                            }) {
                                Text("Close Register")
                            }
                        }
                    )
            }
            .frame(width: UIScreen.main.bounds.width * (385/430), height: UIScreen.main.bounds.height * (780/932))
            .cornerRadius(20)
            .shadow(radius: 10)
            .background(Color.clear) // Ensure the background is clear
            .padding(20)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(showRegister: .constant(true))
    }
}

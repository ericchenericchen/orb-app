import SwiftUI

struct RegisterView: View {
    @Binding var showRegister: Bool

    var body: some View {
        ZStack {
            Color.clear
                .edgesIgnoringSafeArea(.all)

            VStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.white, Color.clear]),
                    startPoint: .top,
                    endPoint: .bottom)
                    .overlay(
                        // Example content
                        VStack {
                            Text("Ready to get to know yourself?")
                                .foregroundColor(.black)
                                .font(.custom("Helvetica Neue", size: 28))
                                .fontWeight(.light)
                                .position(x: 64, y: 111)
                                .frame(width: UIScreen.main.bounds.width * (214/430), height: UIScreen.main.bounds.height * (144/932))
//                                .border(Color.black)
                            Spacer()
                            CustomButton(
                                title: "Continue with Google",
                                foregroundColor: Color.blue,
                                action: {
                                     showRegister.toggle()
                                 }
                            )
                            Text("or")
                            CustomButton(
                                title: "Email (placeholder button)",
                                foregroundColor: Color.bgBlue,
                                backgroundColor: Color.white,
                                action: {
                                    /* empty */
                                 }
                            )
                            CustomButton(
                                title: "Password (placeholder button)",
                                foregroundColor: Color.bgBlue,
                                backgroundColor: Color.white,
                                action: {
                                    /* empty */
                                 }
                            )
                                                        
                            CustomButton(
                                title: "Join Now",
                                widthRatio: 150/430,
                                foregroundColor: Color.white,
                                backgroundColor: Color.bgLightGrey,
                                action: {
                                    /* empty */
                                 }
                            ).padding(.top, 25)
                            
                            Spacer()
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

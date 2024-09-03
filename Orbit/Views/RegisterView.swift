import SwiftUI

struct RegisterView: View {
    @Binding var showRegister: Bool
    @State private var email: String = ""
    @State private var password: String = ""

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
                            
                            Spacer()
                                    .frame(height: 50)

                            CustomButton(
                                title: "Continue with Google",
                                foregroundColor: Color.blue,
                                action: {
                                     showRegister.toggle()
                                 }
                            )
                            Text("or")
                            
                            CustomInputField(
                                            placeholder: "Email",
                                            text: $email
                                        )
                            CustomInputField(
                                            placeholder: "Password",
                                            text: $password,
                                            protected: true
                                        )
                            Spacer()
                                    .frame(height: 25)

                            CustomButton(
                                title: "Join Now",
                                widthRatio: 150/430,
                                foregroundColor: Color.white,
                                backgroundColor: Color.bgBlue,
                                action: {
                                    /*
                                     submission action
                                     */
                                 }
                            )
                            
                            Spacer()
                                    .frame(height: 25)
                            
                            Text("By clicking “Join Now” or “Continue with Google”, you agree to our Terms and Conditions and Privacy Policy.")
                                .font(.custom("Helvetica Neue", size: 12))
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                                .frame(width: UIScreen.main.bounds.width * (294/430))
                            
                            Spacer()
                                    .frame(height: 15)
                            
                            Text("Already have an account? Log In")
                                .font(.custom("Helvetica Neue", size: 12))
                                .fontWeight(.light)
                                .multilineTextAlignment(.center)
                                .frame(width: UIScreen.main.bounds.width * (294/430))


                            
                            Spacer() //pushes everything to the top
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

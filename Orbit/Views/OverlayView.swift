import SwiftUI

struct OverlayView: View {
    @Binding var showOverlay: Bool

    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                Text("Hello, World!")
                    .foregroundColor(.black)
                Button(action: {
                    withAnimation {
                        showOverlay.toggle()
                    }
                }) {
                    Text("Close Overlay")
                }
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width * (385/430), height: UIScreen.main.bounds.height * (780/932))
            .background(
                LinearGradient(gradient: Gradient(colors: [.white, .gradientBlack]), startPoint: .top, endPoint: .bottom)
            )
            .opacity(0.8)
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding()
        }
    }
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView(showOverlay: .constant(true))
    }
}

import SwiftUI

struct ChangeColorsExample: View {
    @State private var filteredImage: UIImage?
    
    //CUSTOM ORB IMAGE STILL A WIP
    var body: some View {
        CustomOrbImage(r: 128, g: 128, b: 255, widthRatio: 1)
    }
}

#Preview {
    ChangeColorsExample()
}

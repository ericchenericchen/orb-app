//
//  CustomOrbImage.swift
//  Orbit
//
//  Created by Eric Chen on 9/2/24.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct CustomOrbImage: View {
    var r: CGFloat = 255 // default color correction to red
    var g: CGFloat = 0
    var b: CGFloat = 0
    var widthRatio: CGFloat = 1 // default frame size to screen width and height
    
    @State private var filteredImage: UIImage?

    var body: some View {
        if let uiImage = filteredImage {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.main.bounds.width * widthRatio, height: UIScreen.main.bounds.width * widthRatio)
        } else {
            Color.clear
                .onAppear(perform: applyColorFilter)
        }
    }

    func applyColorFilter() {
        guard let inputImage = UIImage(named: "OrbitIcon") else { return }
        let ciImage = CIImage(image: inputImage)

        let filter = CIFilter.colorControls()
        filter.inputImage = ciImage
        filter.saturation = 0 // Makes the image grayscale
        filter.brightness = 0
        filter.contrast = 1

        let colorFilter = CIFilter.colorMonochrome()
        colorFilter.inputImage = filter.outputImage
        colorFilter.color = CIColor(red: r / 255.0, green: g/255.0, blue: b/255.0) // Apply the red tint
        colorFilter.intensity = 1

        let context = CIContext()
        if let outputImage = colorFilter.outputImage,
           let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            filteredImage = UIImage(cgImage: cgImage)
        }
    }
}

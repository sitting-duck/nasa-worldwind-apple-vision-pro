/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The model of the teapot.
*/

import SwiftUI
import RealityKit
import WorldAssets

/// A model of the teapot.
struct Teapot: View {
    var scale: Float = 1
    var position: SIMD3<Float> = .zero

    /// The teapot entity that the view creates and stores for later updates.
    @State private var teapot: Entity?

    var body: some View {
        RealityView { content in
            guard let teapot = await WorldAssets.entity(named: "Teapot") else {
                return
            }

            content.add(teapot)
            self.teapot = teapot
            configure()

        } update: { content in
            configure()
        }
    }

    /// Configures the model based on the current set of inputs.
    private func configure() {
        teapot?.scale = SIMD3(repeating: scale)
        teapot?.position = position
    }
}

#Preview {
    Teapot(scale: 0.1)
}

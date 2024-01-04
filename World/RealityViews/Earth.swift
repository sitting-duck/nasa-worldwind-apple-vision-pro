/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
The model of the Earth.
*/

import SwiftUI
import RealityKit
import WorldAssets

/// The model of the Earth.
struct Earth: View {
    var earthConfiguration: EarthEntity.Configuration = .init()
    var satelliteConfiguration: [SatelliteEntity.Configuration] = []
    var moonConfiguration: SatelliteEntity.Configuration? = nil
    var animateUpdates: Bool = false
    var axCustomActionHandler: ((_: AccessibilityEvents.CustomAction) -> Void)? = nil

    /// The Earth entity that the view creates and stores for later updates.
    @State private var earthEntity: EarthEntity?
    @GestureState private var dragState = CGSize.zero
    

    var body: some View {
        RealityView { content in
            // Create an earth entity with tilt, rotation, a moon, and so on.
            let earthEntity = await EarthEntity(
                configuration: earthConfiguration,
                satelliteConfiguration: satelliteConfiguration,
                moonConfiguration: moonConfiguration)
            content.add(earthEntity)

            // Handle custom accessibility events.
            if let axCustomActionHandler {
                _ = content.subscribe(
                    to: AccessibilityEvents.CustomAction.self,
                    on: nil,
                    componentType: nil,
                    axCustomActionHandler)
            }

            // Store for later updates.
            self.earthEntity = earthEntity
            
            

        } update: { content in
            // Reconfigure everything when any configuration changes.
            earthEntity?.update(
                configuration: earthConfiguration,
                satelliteConfiguration: satelliteConfiguration,
                moonConfiguration: moonConfiguration,
                animateUpdates: animateUpdates)
        }
        .onTapGesture(count: 1) {
            print("Earth tapped")
            // Perform your action here
            let newRotation = simd_quatf(angle: .pi / 4, axis: [0, 1, 0]) // Example rotation
                        earthConfiguration.rotation = newRotation

                        // Apply the updated configuration
                        earthEntity?.update(
                            configuration: earthConfiguration,
                            satelliteConfiguration: satelliteConfiguration,
                            moonConfiguration: moonConfiguration,
                            animateUpdates: animateUpdates)
        }.gesture(
            DragGesture()
                .updating($dragState) { drag, state, _ in
                    state = drag.translation
                }
                .onEnded { _ in
                    let dragX = dragState.width
                    let dragY = dragState.height
                    // Convert the 2D drag gesture into a 3D rotation
                    // This is a simplified example and may need to be adjusted
                    let newRotation = simd_quatf(angle: .pi * Float(dragX / 200), axis: [0, 1, 0])
                    earthConfiguration.rotation *= newRotation

                    // Apply the updated configuration
                    earthEntity?.update(
                        configuration: earthConfiguration,
                        satelliteConfiguration: satelliteConfiguration,
                        moonConfiguration: moonConfiguration,
                        animateUpdates: animateUpdates)
                }
        )
    }
}

#Preview {
    Earth(
        earthConfiguration: EarthEntity.Configuration.orbitEarthDefault,
        satelliteConfiguration: [
            SatelliteEntity.Configuration(
                name: "Satellite",
                isVisible: true,
                inclination: .degrees(30),
                speedRatio: 10,
                scale: 1,
                altitude: 0.4,
                traceWidth: 400,
                isTraceVisible: true)
        ]
    )
}
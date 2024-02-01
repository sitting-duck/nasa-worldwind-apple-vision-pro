//
//  Colors.swift
//  World
//
//  Created by Ashley Gelwix on 1/18/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import Foundation
import SwiftUI

struct Colors {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    var alpha: CGFloat

    // Standard Colors as static constants
    static let white = Colors(red: 1, green: 1, blue: 1, alpha: 1)
    static let black = Colors(red: 0, green: 0, blue: 0, alpha: 1)
    static let red = Colors(red: 1, green: 0, blue: 0, alpha: 1)
    static let green = Colors(red: 0, green: 1, blue: 0, alpha: 1)
    static let blue = Colors(red: 0, green: 0, blue: 1, alpha: 1)
    static let cyan = Colors(red: 0, green: 1, blue: 1, alpha: 1)
    static let yellow = Colors(red: 1, green: 1, blue: 0, alpha: 1)
    static let pink = Colors(red: 1, green: 0.753, blue: 0.796, alpha: 1)
    static let magenta = Colors(red: 1, green: 0, blue: 1, alpha: 1)
    static let lightGray = Colors(red: 0.75, green: 0.75, blue: 0.75, alpha: 1)
    static let mediumGray = Colors(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    static let darkGray = Colors(red: 0.25, green: 0.25, blue: 0.25, alpha: 1)
    static let transparent = Colors(red: 0, green: 0, blue: 0, alpha: 0)

    // Initializer
    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.red = red      // a number between 0 and 1
        self.green = green  // a number between 0 and 1
        self.blue = blue    // a number between 0 and 1
        self.alpha = alpha  // a number between 0 and 1
    }

    // Method to set color
    mutating func set(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        self.red = red     // a number between 0 and 1
        self.green = green // a number between 0 and 1
        self.blue = blue   // a number between 0 and 1
        self.alpha = alpha // a number between 0 and 1
    }

    // Copy method - creates a copy of a given Colors object
    static func copy(from color: Colors) -> Colors {
        return Colors(red: color.red, green: color.green, blue: color.blue, alpha: color.alpha)
    }

    // premultipliedComponents method - returns the color's components premultiplied by its alpha component
    func premultipliedComponents() -> [CGFloat] {
        let a = alpha
        return [red * a, green * a, blue * a, a]
    }
    
    // Construct a color from a byte array
    // In Swift, you can use Data or [UInt8] (an array of UInt8) to represent a byte array. The UInt8 type in Swift is equivalent to a byte and
    // can represent values from 0 to 255.
    static func colorFromByteArray(_ bytes: [UInt8]) -> Colors {
        guard bytes.count >= 4 else {
            fatalError("ByteArray must contain at least 4 elements")
        }

        return Colors(
            red: CGFloat(bytes[0]) / 255.0,
            green: CGFloat(bytes[1]) / 255.0,
            blue: CGFloat(bytes[2]) / 255.0,
            alpha: CGFloat(bytes[3]) / 255.0
        )
    }
    
    // Constructs a color from byte values
    static func colorFromBytes(redByte: UInt8, greenByte: UInt8, blueByte: UInt8, alphaByte: UInt8) -> Colors {
        return Colors(
            red: CGFloat(redByte) / 255.0,
            green: CGFloat(greenByte) / 255.0,
            blue: CGFloat(blueByte) / 255.0,
            alpha: CGFloat(alphaByte) / 255.0
        )
    }

    // Convert to SwiftUI Color
    func toSwiftUIColor() -> Color {
        return Color(red: Double(red), green: Double(green), blue: Double(blue), opacity: Double(alpha))
    }
}

// Usage
let myWhiteColor = Colors.white.toSwiftUIColor()

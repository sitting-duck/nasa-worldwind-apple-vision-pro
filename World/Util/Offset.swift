import Foundation


class Offset {
    var x: Double
    var y: Double
    private var xUnits: String
    private var yUnits: String

    init(xUnits: String, x: Double, yUnits: String, y: Double) {
        self.x = x
        self.y = y
        self.xUnits = xUnits
        self.yUnits = yUnits
    }

    func clone() -> Offset {
        return Offset(xUnits: self.xUnits, x: self.x, yUnits: self.yUnits, y: self.y)
    }

    func offsetForSize(width: Double, height: Double) -> Vec2 {
        var x: Double
        var y: Double

        if self.xUnits == AVKey.values["offsetFraction"] {
            x = width * self.x
        } else if self.xUnits == AVKey.values["offsetInsetPixels"] {
            x = width - self.x
        } else { // Default to OFFSET_PIXELS
            x = self.x
        }

        if self.yUnits == AVKey.values["offsetFraction"] {
            y = height * self.y
        } else if self.yUnits == AVKey.values["offsetInsetPixels"] {
            y = height - self.y
        } else { // Default to OFFSET_PIXELS
            y = self.y
        }

        return Vec2(x: x, y: y)
    }

    func toString() -> String {
        return "\(self.xUnits) \(self.x) \(self.yUnits) \(self.y)"
    }
}

// Ensure that the Vec2 class is defined in Swift
// This is just a placeholder; replace it with the actual Vec2 class definition.
//class Vec2 {
//    var x: Double
//    var y: Double
//
//    init(x: Double, y: Double) {
//        self.x = x
//        self.y = y
//    }
//}

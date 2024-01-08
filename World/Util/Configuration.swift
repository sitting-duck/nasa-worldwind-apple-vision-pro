import Foundation

class Configuration {
    var gpuCacheSize: Double
    var baseUrl: String
    var layerRetrievalQueueSize: Int
    var coverageRetrievalQueueSize: Int
    var bingLogoPlacement: Offset
    var bingLogoAlignment: Offset

    init() {
        self.gpuCacheSize = 250e6
        // The base URL might need to be adapted based on how WWUtil.worldwindlibLocation() and
        // WWUtil.currentUrlSansFilePart() are implemented in Swift.
        self.baseUrl = WWUtil.worldwindlibLocation() ?? "\(WWUtil.currentUrlSansFilePart())/.."
        self.layerRetrievalQueueSize = 16
        self.coverageRetrievalQueueSize = 16
        self.bingLogoPlacement = Offset(xUnits: String(AVKey.values["offsetInsetPixels"] ?? "0"), x: 7, yUnits: String(AVKey.values["offsetPixels"] ?? "0"), y: 7)
        self.bingLogoAlignment = Offset(xUnits: AVKey.values["offsetFraction"] ?? "0", x: 1, yUnits: AVKey.values["offsetFraction"] ?? "0", y: 0)
    }
}

//// Make sure to have the Offset and AVKey classes or structs defined in Swift
//// These are placeholders; replace them with the actual definitions.
//struct Offset {
//    var xUnits: String
//    var x: Double
//    var yUnits: String
//    var y: Double
//
//    init(xUnits: String, x: Double, yUnits: String, y: Double) {
//        self.xUnits = xUnits
//        self.x = x
//        self.yUnits = yUnits
//        self.y = y
//    }
//}
//
//struct AVKey {
//    static let offsetInsetPixels = "insetPixels"
//    static let offsetPixels = "pixels"
//    static let offsetFraction = "fraction"
//    // ... other AVKey values ...
//}
//
//// Placeholder for WWUtil; implement its methods based on TypeScript functionality.
//class WWUtil {
//    static func worldwindlibLocation() -> String? {
//        // Implementation depends on specific app logic or structure
//        return nil
//    }
//
//    static func currentUrlSansFilePart() -> String {
//        // Implementation depends on specific app logic or structure
//        return ""
//    }
//}

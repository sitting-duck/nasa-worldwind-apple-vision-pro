import Foundation

class WWUtil {
    // Constants and static properties
    private static let jsonpSig = "jsonp_start"
    public static let latLonRegex = "^(-?\\d+(\\.\\d+)?),\\s*(-?\\d+(\\.\\d+)?)$"
    private static var jsonpCounter: Int = 0

    // Function to get the suffix for a mime type
    static func suffixForMimeType(mimeType: String) -> String? {
        switch mimeType {
        case "image/png":
            return "png"
        case "image/jpeg":
            return "jpg"
        case "application/bil16", "application/bil32":
            return "bil"
        default:
            return nil
        }
    }

    // Function to get the current URL sans file part
    static func currentUrlSansFilePart() -> String {
        let url = URL(string: Bundle.main.bundleURL.absoluteString)
        return url?.deletingLastPathComponent().absoluteString ?? ""
    }

    // Function to get the WorldWind library location
    static func worldwindlibLocation() -> String? {
        // This functionality might not be directly translatable to Swift.
        // You might need to find an alternative approach based on your app's structure.
        return nil
    }

    // Function to get the URL path component
    static func urlPath(url: String) -> String {
        return URL(string: url)?.path ?? ""
    }

    // Function to compare two typed arrays for equality
    // You will need to define WWTypedArray protocol or type in Swift.
//    static func typedArraysEqual(array1: WWTypedArray, array2: WWTypedArray) -> Bool {
//        // Implementation will depend on the definition of WWTypedArray in Swift
//        return false
//    }

    // Function to print a typed array
//    static func printTypedArray(array: WWTypedArray, max: Int = Int.max) {
//        // Implementation will depend on the definition of WWTypedArray in Swift
//    }

    // Function to find NaN in a typed array
//    static func findNaN(array: WWTypedArray) -> Int {
//        // Implementation will depend on the definition of WWTypedArray in Swift
//        return -1
//    }

    // Function to multiply each element of an array by a value
    static func multiplyArray(array: inout [Double], value: Double) {
        for i in 0..<array.count {
            array[i] *= value
        }
    }

    // Function to transform an item to boolean
    static func transformToBoolean(item: String) -> Bool {
        return item == "0" || item == "false" ? false : Bool(item) ?? false
    }

    // Function to generate a unique GUID
    static func guid() -> String {
        func s4() -> String {
            return String(format: "%04x", arc4random() % 0x10000)
        }

        return "\(s4())\(s4())-\(s4())-\(s4())-\(s4())-\(s4())\(s4())\(s4())"
    }

    // Function to convert a string to a date
    static func date(from item: String) -> Date? {
        return ISO8601DateFormatter().date(from: item)
    }

    // Functions to determine if a string starts or ends with a substring
    static func startsWith(subjectString: String, searchString: String, position: Int = 0) -> Bool {
        return subjectString.hasPrefix(searchString)
    }

    static func endsWith(subjectString: String, searchString: String, length: Int? = nil) -> Bool {
        return subjectString.hasSuffix(searchString)
    }

    // Function to fetch a file (similar to XMLHttpRequest)
    static func fetchFile(url: String, completion: @escaping (String?) -> Void) {
        guard let url = URL(string: url) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            let responseText = String(data: data, encoding: .utf8)
            completion(responseText)
        }

        task.resume()
    }

    // Additional functions like jsonp would need to be adapted for Swift's capabilities and context
}

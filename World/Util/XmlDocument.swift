import Foundation
import SwiftUI

class XmlDocument: NSObject, XMLParserDelegate {
    private var xmlContent: String

    init(document: String) {
        self.xmlContent = document
    }

    func parse() -> Bool {
        guard let data = xmlContent.data(using: .utf8) else {
            print("Invalid XML document")
            return false
        }

        let parser = XMLParser(data: data)
        parser.delegate = self
        return parser.parse()
    }

    static func isValid(document: String) -> Bool {
        return XmlDocument(document: document).parse()
    }

    // XMLParser Delegate methods
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        // Handle start of an element
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
        // Handle found characters
    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        // Handle end of an element
    }

    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        // Handle parsing error
        print("Error while parsing XML: \(parseError.localizedDescription)")
    }
}

// Example usage in a SwiftUI View
struct ContentView: View {
    var body: some View {
        Text("XML Parsing in SwiftUI")
            .onAppear {
                let xmlString = "<your-xml-here>"
                let isValid = XmlDocument.isValid(document: xmlString)
                print(isValid ? "Valid XML" : "Invalid XML")
            }
    }
}

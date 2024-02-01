import Foundation

enum WWError : Error {
    case customError(String)
}

public struct Severity {
    static let levelNone: Int = 0
    static let levelSevere: Int = 1
    static let levelWarning: Int = 2
    static let levelInfo: Int = 3
}

public enum MessageTable {
    static let values: [String: String] = [
        "abstractInvocation": "The function called is abstract and must be overridden in a subclass.",
        "asymmetricMatrix": "The specified matrix is not symmetric.",
        "cacheSpaceError": "Failed to acquire requested space in the cache for size: ",
        "documentRetrievalFailed": "Document retrieval failed.",
        "documentRetrievalTimedOut": "Document retrieval timed out.",
        "indexOutOfRange": "The specified index is out of range.",
        "invalidAltitudeMode": "The specified altitude mode is not valid.",
        "invalidArgumentValue": "Invalid argument value provided.",
        "invalidArgumentCount": "Not enough arguments supplied.",
        "invalidByteOrderValue": "Invalid byte order specified.",
        "invalidColumn": "The specified column is out of range.",
        "invalidCoordinatesType": "The specified coordinate type is invalid.",
        "invalidEvent": "The specified event is invalid.",
        "invalidFeatures": "The specified features are invalid.",
        "invalidGeoJSONObjectLength": "The GeoJSON object length is invalid.",
        "invalidGeoJSONType": "The specified GeoJSON type is invalid.",
        "invalidGeometries": "The specified geometries are invalid.",
        "invalidGeoTiffFile": "The GeoTIFF file is invalid.",
        "invalidHeight": "The specified height is zero or negative.",
        "invalidKeyType": "The specified key type for this value is incorrect.",
        "invalidLinearRing": "The specified linear ring is zero or negative.",
        "invalidLowWater": "Specified cache low-water value is undefined, negative or not less than the current capacity.",
        "invalidNumberOfCoordinates": "The specified number of coordinates is invalid.",
        "invalidNumberOfLevels": "The specified number of levels is invalid",
        "invalidResolution": "The specified resolution is out of range.",
        "invalidRow": "The specified row is out of range.",
        "invalidSize": "The specified size is not valid.",
        "invalidStride": "The specified stride is invalid.",
        "invalidTiffFileType": "Invalid Tiff File Type encountered.",
        "invalidTypeOfIFD": "Encountered an unknown IFD.",
        "invalidTypeOfRenderable": "Invalid type of renderable encountered.",
        "invalidUrl": "The specified URL is invalid.",
        "invalidWidth": "The specified width is zero or negative.",
        "invalidXmlDocument": "The specified XML document is invalid.",
        "missingAltitudeMode": "The specified altitude mode is null or undefined.",
        "missingAngle": "The specified Angle is null or undefined.",
        "missingArrayBuffer": "The specified array buffer is null or undefined",
        "missingAttributeName": "The specified DBase attribute file name is null or undefined.",
        "missingArray": "The specified array is null, undefined or of insufficient length.",
        "missingAxes": "The specified axes are null, undefined or of insufficient length.",
        "missingBoundaries": "The specified boundaries array is null or undefined.",
        "missingBuffer": "The specified buffer descriptor is null or undefined.",
        "missingCelestialLocation": "The specified celestial location is null or undefined.",
        "missingColor": "The specified color is null or undefined.",
        "missingConfig": "The specified config is null or undefined.",
        "missingCoordinates": "The specified config is null or undefined.",
        "missingCount": "The specified count is null or undefined.",
        "missingCoverage": "The specified coverage is null or undefined.",
        "missingDataSource": "The specified data source is null or undefined.",
        "missingDate": "The specified date is null or undefined.",
        "missingDC": "The specified draw context is null or undefined.",
        "missingDomElement": "The specified DOM element is null or undefined.",
        "missingDrawContext": "The specified DrawContext is null or undefined.",
        "missingEntry": "The specified entry is null or undefined.",
        "missingExtensionName": "The specified extension is null or undefined.",
        "missingFeature": "The specified feature is null or undefined.",
        "missingFeatureCollection": "The specified feature collection is null or undefined.",
        "missingFont": "The specified font is null or undefined.",
        "missingFrustum": "The specified frustum is null or undefined.",
        "missingFunction": "The specified function is null or undefined.",
        "missingGeoKeyDirectoryTag": "Missing GeoTIFF Geo Key.",
        "missingGeoJSONType": "Missing GeoJSON type.",
        "missingGeometries": "The specified geometries are null or undefined.",
        "missingGeoTiffData": "The specified GeoTiff data is null or undefined.",
        "missingGlContext": "The specified WebGL rendering context is null or undefined.",
        "missingGlobe": "The specified globe is null or undefined.",
        "missingId": "The specified id is null or undefined.",
        "missingImage": "The specified image is null or undefined.",
        "missingImageFormat": "The specified image format is null or undefined.",
        "missingIndices": "The specified indices array is null or undefined.",
        "missingFeatureGeometryType": "The specified geometry type is null or undefined.",
        "missingFeatures": "The specified features are null or undefined.",
        "missingFragMode": "The specified frag mode is null or undefined.",
        "missingGeometry": "The specified geometry is null or undefined.",
        "missingGeometryCollection": "The specified geometry collection is null or undefined.",
        "missingGlobeRadius": "The specified globe radius is null or undefined.",
        "missingKey": "The specified key is null or undefined.",
        "missingLatitude": "The specified latitude is null or undefined.",
        "missingLayer": "The specified layer is null or undefined.",
        "missingLength": "The specified length is null or undefined.",
        "missingLevel": "The specified level is null or undefined.",
        "missingLine": "The specified line is null or undefined.",
        "missingLines": "The specified lines are null or undefined.",
        "missingList": "The specified list is null or undefined.",
        "missingListener": "The specified listener is null or undefined",
        "missingIsLittleEndian": "The specified little endian flag is null or undefined",
        "missingLocation": "The specified location is null or undefined.",
        "missingLongitude": "The specified location is null or undefined.",
        "missingMatrix": "The specified matrix is null or undefined.",
        "missingMaxMag": "The specified maximum magnitude is null or undefined.",
        "missingMinMag": "The specified minimum magnitude is null or undefined.",
        "missingModelview": "The specified model view matrix is null or undefined.",
        "missingName": "The specified name is null or undefined.",
        "missingNumDays": "The specified number of days is null or undefined.",
        "missingObject": "The specified object is null or undefined.",
        "missingOffset": "The specified offset is null or undefined.",
        "missingPath": "The specified path is null or undefined.",
        "missingPlacename": "The specified place name is null or undefined.",
        "missingPlane": "The specified plane is null or undefined.",
        "missingPoint": "The specified point is null or undefined.",
        "missingPoints": "The specified points array is null or undefined.",
        "missingPosition": "The specified position is null or undefined.",
        "missingPositions": "The specified positions array is null or undefined.",
        "missingProgram": "The specified program is null or undefined.",
        "missingProjection": "The specified projection is null or undefined.",
        "missingProperties": "The specified properties are null or undefined.",
        "missingQuaternion": "The specified Quaternion is null or undefined.",
        "missingRay": "The specified ray is null or undefined.",
        "missingRectangle": "The specified rectangle is null or undefined.",
        "missingRenderable": "The specified renderable is null or undefined.",
        "missingRenderables": "The specified renderables are null or undefined.",
        "missingResolution": "The specified resolution is null, undefined, or zero.",
        "missingResource": "The specified resource is null or undefined.",
        "missingResult": "The specified result variable is null or undefined.",
        "missingResults": "The specified results array is null or undefined.",
        "missingSector": "The specified sector is null or undefined.",
        "missingShapeType": "The specified shape type is null or undefined.",
        "missingSize": "The specified size is null or undefined.",
        "missingString": "The specified string is null or undefined.",
        "missingTag": "The specified tag is null or undefined.",
        "missingTargetResolution": "The specified target resolution is null or undefined.",
        "missingTessellator": "The specified tessellator is null or undefined.",
        "missingText": "The specified text is null or undefined.",
        "missingTexture": "The specified texture is null or undefined.",
        "missingTiffTagLocation": "The tiff tag location is missing",
        "missingTile": "The specified tile is null or undefined.",
        "missingTileList": "The specified tile is null or undefined.",
        "missingType": "The specified type is null or undefined.",
        "missingUrl": "The specified URL is null or undefined",
        "missingValueOffset": "The specified value offset is null or undefined.",
        "missingVector": "The specified vector is null or undefined.",
        "missingVertex": "The specified vertex is null or undefined.",
        "missingViewport": "The specified viewport is null or undefined.",
        "missingWebCoverageService": "The specified WebCoverageService is null or undefined.",
        "missingWorldWindow": "The specified WorldWindow is null or undefined.",
        "missingXValue": "The X value is null or undefined.",
        "missingYValue": "The Y value is null or undefined.",
        "noBytesRequested": "No bytes were requested.",
        "notYetImplemented": "This function is not yet implemented",
        "tooManyBytesRequested": "Too many bytes were requested.",
        "unexpectedEvent": "This event is not supported.",
        "unknownColorName": "The colornameis not recognized.",
        "unsupportedFormat": "The specified format is not supported.",
        "unsupportedOperation": "This operation is not supported.",
        "unsupportedVersion": "The specified version is not supported.",
        "valueOutOfRange": "The specified value is out of range.",
        "webglNotSupported": "The browser does not support WebGL, or WebGL is disabled."
    ]
}

public class Logger {
    public static var Level = Severity.self
    public static var messageTable = MessageTable.self
    private static var loggingLevel: Int = Logger.Level.levelSevere

    public static func setLoggingLevel(level: Int) {
        Logger.loggingLevel = level
    }

    public static func getLoggingLevel() -> Int {
        return Logger.loggingLevel
    }

    public static func log(level: Int, message: String, stack: String? = nil) {
        if !message.isEmpty && level > 0 && level <= Logger.loggingLevel {
            switch level {
            case Severity.levelSevere:
                print("Error: \(message)")
            case Severity.levelWarning:
                print("Warning: \(message)")
            case Severity.levelInfo:
                print("Info: \(message)")
            default:
                print(message)
            }
            if let stackTrace = stack {
                print("Stack: \(stackTrace)")
            }
        }
    }

    public static func logMessage(level: Int, className: String, functionName: String, message: String, stack: String? = nil) -> String {
        let msg = "\(className).\(functionName): \(message)"
        Logger.log(level: level, message: msg, stack: stack)
        return msg
    }
}

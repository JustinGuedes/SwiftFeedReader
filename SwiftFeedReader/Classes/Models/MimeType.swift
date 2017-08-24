//
//  MimeType.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/24.
//

public enum MediaType {
    case audio
    case image
    case video
    case unknown
}

public enum MimeType: RawRepresentable {
    
    case aac // AAC audio file
    case abw // AbiWord document
    case avi // AVI: Audio Video Interleave
    case azw // Amazon Kindle eBook format
    case bin // Any kind of binary data
    case bz // BZip archive
    case bz2 // BZip2 archive
    case csh // C-Shell script
    case css // Cascading Style Sheets (CSS)
    case csv // Comma-separated values (CSV)
    case doc // Microsoft Word
    case eot // MS Embedded OpenType fonts
    case epub // Electronic publication (EPUB)
    case gif // Graphics Interchange Format (GIF)
    case html // HyperText Markup Language (HTML)
    case ico // Icon format
    case ics // iCalendar format
    case jar // Java Archive (JAR)
    case jpeg // JPEG images
    case js // JavaScript (ECMAScript)
    case json // JSON format
    case midi // Musical Instrument Digital Interface (MIDI)
    case mpeg // MPEG Video
    case mpegAudio // MPEG Audio
    case mpkg // Apple Installer Package
    case odp // OpenDocuemnt presentation document
    case ods // OpenDocuemnt spreadsheet document
    case odt // OpenDocument text document
    case oga // OGG audio
    case ogv // OGG video
    case ogx // OGG
    case otf // OpenType font
    case png // Portable Network Graphics
    case pdf // Adobe Portable Document Format (PDF)
    case ppt // Microsoft PowerPoint
    case rar // RAR archive
    case rtf // Rich Text Format (RTF)
    case sh // Bourne shell script
    case svg // Scalable Vector Graphics (SVG)
    case swf // Small web format (SWF) or Adobe Flash document
    case tar // Tape Archive (TAR)
    case tiff // Tagged Image File Format (TIFF)
    case ts // Typescript file
    case ttf // TrueType Font
    case vsd // Microsoft Visio
    case wav // Waveform Audio Format
    case weba // WEBM audio
    case webm // WEBM video
    case webp // WEBP image
    case woff // Web Open Font Format (WOFF)
    case woff2 // Web Open Font Format (WOFF)
    case xhtml // XHTML
    case xlsx // Microsoft Excel
    case xlsxAlt // Microsoft Excel
    case xml // XML
    case xul // XUL
    case zip // ZIP archive
    case threegp // 3GPP audio/video container
    case threegpAudio // if it doesn't contain video
    case threeg2 // 3GPP2 audio/video container
    case threeg2Audio // if it doesn't contain video
    case sevenz // 7-zip archive
    case other(String)
    
    public init?(rawValue: String) {
        switch rawValue {
        case "audio/aac": self = .aac
        case "application/x-abiword": self = .abw
        case "video/x-msvideo": self = .avi
        case "application/vnd.amazon.ebook": self = .azw
        case "application/octet-stream": self = .bin
        case "application/x-bzip": self = .bz
        case "application/x-bzip2": self = .bz2
        case "application/x-csh": self = .csh
        case "text/css": self = .css
        case "text/csv": self = .csv
        case "application/msword": self = .doc
        case "application/vnd.ms-fontobject": self = .eot
        case "application/epub+zip": self = .epub
        case "image/gif": self = .gif
        case "text/html": self = .html
        case "image/x-icon": self = .ico
        case "text/calendar": self = .ics
        case "application/java-archive": self = .jar
        case "image/jpeg": self = .jpeg
        case "application/javascript": self = .js
        case "application/json": self = .json
        case "audio/midi": self = .midi
        case "video/mpeg": self = .mpeg
        case "audio/mpeg": self = .mpegAudio
        case "application/vnd.apple.installer+xml": self = .mpkg
        case "application/vnd.oasis.opendocument.presentation": self = .odp
        case "application/vnd.oasis.opendocument.spreadsheet": self = .ods
        case "application/vnd.oasis.opendocument.text": self = .odt
        case "audio/ogg": self = .oga
        case "video/ogg": self = .ogv
        case "application/ogg": self = .ogx
        case "font/otf": self = .otf
        case "image/png": self = .png
        case "application/pdf": self = .pdf
        case "application/vnd.ms-powerpoint": self = .ppt
        case "application/x-rar-compressed": self = .rar
        case "application/rtf": self = .rtf
        case "application/x-sh": self = .sh
        case "image/svg+xml": self = .svg
        case "application/x-shockwave-flash": self = .swf
        case "application/x-tar": self = .tar
        case "image/tiff": self = .tiff
        case "application/typescript": self = .ts
        case "font/ttf": self = .ttf
        case "application/vnd.visio": self = .vsd
        case "audio/x-wav": self = .wav
        case "audio/webm": self = .weba
        case "video/webm": self = .webm
        case "image/webp": self = .webp
        case "font/woff": self = .woff
        case "font/woff2": self = .woff2
        case "application/xhtml+xml": self = .xhtml
        case "application/vnd.ms-excel": self = .xlsx
        case "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet": self = .xlsxAlt
        case "application/xml": self = .xml
        case "application/vnd.mozilla.xul+xml": self = .xul
        case "application/zip": self = .zip
        case "video/3gpp": self = .threegp
        case "audio/3gpp": self = .threegpAudio
        case "video/3gpp2": self = .threeg2
        case "audio/3gpp2": self = .threeg2Audio
        case "application/x-7z-compressed": self = .sevenz
        default: self = .other(rawValue)
        }
    }
    
    public var rawValue: String {
        let result: String
        switch self {
        case .aac:  result = "audio/aac"
        case .abw:  result = "application/x-abiword"
        case .avi:  result = "video/x-msvideo"
        case .azw:  result = "application/vnd.amazon.ebook"
        case .bin:  result = "application/octet-stream"
        case .bz:  result = "application/x-bzip"
        case .bz2:  result = "application/x-bzip2"
        case .csh:  result = "application/x-csh"
        case .css:  result = "text/css"
        case .csv:  result = "text/csv"
        case .doc:  result = "application/msword"
        case .eot:  result = "application/vnd.ms-fontobject"
        case .epub:  result = "application/epub+zip"
        case .gif:  result = "image/gif"
        case .html:  result = "text/html"
        case .ico:  result = "image/x-icon"
        case .ics:  result = "text/calendar"
        case .jar:  result = "application/java-archive"
        case .jpeg:  result = "image/jpeg"
        case .js:  result = "application/javascript"
        case .json:  result = "application/json"
        case .midi:  result = "audio/midi"
        case .mpeg:  result = "video/mpeg"
        case .mpegAudio:  result = "audio/mpeg"
        case .mpkg:  result = "application/vnd.apple.installer+xml"
        case .odp:  result = "application/vnd.oasis.opendocument.presentation"
        case .ods:  result = "application/vnd.oasis.opendocument.spreadsheet"
        case .odt:  result = "application/vnd.oasis.opendocument.text"
        case .oga:  result = "audio/ogg"
        case .ogv:  result = "video/ogg"
        case .ogx:  result = "application/ogg"
        case .otf:  result = "font/otf"
        case .png:  result = "image/png"
        case .pdf:  result = "application/pdf"
        case .ppt:  result = "application/vnd.ms-powerpoint"
        case .rar:  result = "application/x-rar-compressed"
        case .rtf:  result = "application/rtf"
        case .sh:  result = "application/x-sh"
        case .svg:  result = "image/svg+xml"
        case .swf:  result = "application/x-shockwave-flash"
        case .tar:  result = "application/x-tar"
        case .tiff:  result = "image/tiff"
        case .ts:  result = "application/typescript"
        case .ttf:  result = "font/ttf"
        case .vsd:  result = "application/vnd.visio"
        case .wav:  result = "audio/x-wav"
        case .weba:  result = "audio/webm"
        case .webm:  result = "video/webm"
        case .webp:  result = "image/webp"
        case .woff:  result = "font/woff"
        case .woff2:  result = "font/woff2"
        case .xhtml:  result = "application/xhtml+xml"
        case .xlsx:  result = "application/vnd.ms-excel"
        case .xlsxAlt:  result = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        case .xml:  result = "application/xml"
        case .xul:  result = "application/vnd.mozilla.xul+xml"
        case .zip:  result = "application/zip"
        case .threegp:  result = "video/3gpp"
        case .threegpAudio:  result = "audio/3gpp"
        case .threeg2:  result = "video/3gpp2"
        case .threeg2Audio:  result = "audio/3gpp2"
        case .sevenz:  result = "application/x-7z-compressed"
        case let .other(mimeType): result = mimeType
        }
        
        return result
    }
    
    public var type: MediaType {
        switch self {
        case .aac, .midi, .mpegAudio, .oga, .weba, .threegpAudio, .threeg2Audio:
            return .audio
        case .gif, .jpeg, .png, .svg, .webp:
            return .image
        case .avi, .mpeg, .ogv, .vsd, .webm, .threegp, .threeg2:
            return .video
        default:
            return .unknown
        }
    }
    
}

extension MimeType {
    
    static var parameter: Parameter<MimeType> {
        return Parameter(apiDescription: "mime type") {
            guard let mimeTypeString = $0 as? String,
                let mimeType = MimeType(rawValue: mimeTypeString) else {
                    throw SwiftFeedReaderError.cannotParse("mime type")
            }
            
            return mimeType
        }
    }
    
}

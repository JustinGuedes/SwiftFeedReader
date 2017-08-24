//
//  RSSEnclosure.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/24.
//

public extension RSSChannel {
    
    /// Represents an enclosure of an RSS item.
    struct Enclosure {
        
        /// URL where the enclosure if located.
        ///
        /// Example: http://www.scripting.com/mp3s/weatherReportSuite.mp3
        public let url: URL
        fileprivate static let _url = NamedParameter(apiDescription: "URL where the enclosure if located.",
                                                     key: "url",
                                                     parameter: URL.parameter)
        
        /// The size of the enclosure in bytes.
        ///
        /// Example: 12216320
        public let length: Int
        fileprivate static let _length = NamedParameter(apiDescription: "The size of the enclosure in bytes.",
                                                        key: "length",
                                                        parameter: Int.parameter)
        
        /// Standard MIME type of the enclosure.
        ///
        /// Example: audio/mpeg
        public let type: MimeType
        fileprivate static let _type = NamedParameter(apiDescription: "Standard MIME type of the enclosure.",
                                                      key: "type",
                                                      parameter: MimeType.parameter)
        
        /// Curried version of the initialiser.
        fileprivate static let makeEnclosure = curry(Enclosure.init)
        
    }
    
}

extension RSSChannel.Enclosure: Equatable {
    
    public static func ==(lhs: RSSChannel.Enclosure, rhs: RSSChannel.Enclosure) -> Bool {
        return lhs.url == rhs.url &&
            lhs.length == rhs.length &&
            lhs.type == rhs.type
    }
    
}

extension RSSChannel.Enclosure {
    
    static var parameter: Parameter<RSSChannel.Enclosure> {
        return Parameter(apiDescription: "enclosure") {
            let dictParser = DictionaryParser(pure: makeEnclosure)
                <*> _url
                <*> _length
                <*> _type
            guard let dictionary = $0 as? [String: Any] else {
                throw SwiftFeedReaderError.cannotParse("enclosure - not correct format")
            }
            
            return try dictParser.parse(dictionary)
        }
    }
    
}

//
//  RSSSource.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/24.
//

public extension RSSChannel {
    
    struct Source {
        
        /// Its value is the name of the RSS channel that the item came
        /// from.
        ///
        /// Example: Tomalak's Realm
        public let title: String
        fileprivate static let _title = NamedParameter(apiDescription: "Its value is the name of the RSS channel that the item came from.",
                                                       key: "source",
                                                       parameter: String.parameter)
        
        /// Links to the XMLization of the source.
        ///
        /// Example: http://static.userland.com/tomalak/links2.xml
        public let url: URL
        fileprivate static let _url = NamedParameter(apiDescription: "Links to the XMLization of the source.",
                                                     key: "url",
                                                     parameter: URL.parameter)
        
        /// Curried version of the initialiser.
        fileprivate static let makeSource = curry(Source.init)
        
    }
    
}

extension RSSChannel.Source: Equatable {
    
    public static func ==(lhs: RSSChannel.Source, rhs: RSSChannel.Source) -> Bool {
        return lhs.title == rhs.title &&
            lhs.url == rhs.url
    }
    
}

extension RSSChannel.Source {
    
    static var parameter: Parameter<RSSChannel.Source> {
        return Parameter(apiDescription: "source") {
            let dictParser = DictionaryParser(pure: makeSource)
                <*> _title
                <*> _url
            guard let dictionary = $0 as? [String: Any] else {
                throw SwiftFeedReaderError.cannotParse("source - not correct format")
            }
            
            return try dictParser.parse(dictionary)
        }
    }
    
}

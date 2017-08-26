//
//  RSSSource.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/24.
//

public extension RSS {
    
    struct Source {
        
        /// Its value is the name of the RSS channel that the item came
        /// from.
        ///
        /// Example: Tomalak's Realm
        public let name: String
        fileprivate static let _name = NamedParameter(apiDescription: "Its value is the name of the RSS channel that the item came from.",
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

extension RSS.Source: Equatable {
    
    public static func ==(lhs: RSS.Source, rhs: RSS.Source) -> Bool {
        return lhs.name == rhs.name &&
            lhs.url == rhs.url
    }
    
}

extension RSS.Source {
    
    static var parameter: Parameter<RSS.Source> {
        return Parameter(apiDescription: "source") {
            let dictParser = DictionaryParser(pure: makeSource)
                <*> _name
                <*> _url
            guard let dictionary = $0 as? [String: Any] else {
                throw SwiftFeedReaderError.cannotParse("source - not correct format")
            }
            
            return try dictParser.parse(dictionary)
        }
    }
    
}

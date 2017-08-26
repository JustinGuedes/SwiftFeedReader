//
//  RSSGUID.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/24.
//

public extension RSS {
    
    struct GUID {
        
        /// String that uniquely identifies the item.
        ///
        /// Example: http://some.server.com/weblogItem3207
        public let uniqueId: String
        fileprivate static let _uniqueId = NamedParameter(apiDescription: "String that uniquely identifies the item.",
                                                          key: "guid",
                                                          parameter: String.parameter)
        
        /// If true, the reader may assume that it is a permalink
        /// to the item.
        public let isPermaLink: Bool?
        fileprivate static let _isPermaLink = NamedParameter(apiDescription: "Determines whether the guid is a link or not.",
                                                             key: "isPermaLink",
                                                             parameter: Bool.parameter).optional
        
        /// Curried version of the initialiser.
        fileprivate static let makeGUID = curry(GUID.init)
        
    }
    
}

extension RSS.GUID: Equatable {
    
    public static func ==(lhs: RSS.GUID, rhs: RSS.GUID) -> Bool {
        return lhs.uniqueId == rhs.uniqueId &&
            lhs.isPermaLink == rhs.isPermaLink
    }
    
}

extension RSS.GUID {
    
    static var parameter: Parameter<RSS.GUID> {
        return Parameter(apiDescription: "guid") {
            let dictParser = DictionaryParser(pure: makeGUID)
                <*> _uniqueId
                <*> _isPermaLink
            guard let dictionary = $0 as? [String: Any] else {
                throw SwiftFeedReaderError.cannotParse("guid - not correct format")
            }
            
            return try dictParser.parse(dictionary)
        }
    }
    
}

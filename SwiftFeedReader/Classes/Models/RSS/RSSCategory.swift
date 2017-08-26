//
//  RSSCategory.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/22.
//

public extension RSS {
    
    /// Category that the channel belongs to.
    struct Category {
        
        /// Name of the category.
        ///
        /// Example: Newspaper
        public let name: String
        fileprivate static let _name = NamedParameter(apiDescription: "Name of the category.",
                                                      key: "category",
                                                      parameter: String.parameter)
        
        /// Domain of the category.
        ///
        /// Example: http://www.fool.com/cusips
        public let domain: String?
        fileprivate static let _domain = NamedParameter(apiDescription: "Domain of the category.",
                                                        key: "domain",
                                                        parameter: String.parameter).optional
        
        /// Curried version of the initialiser.
        fileprivate static let makeCategory = curry(Category.init)
        
    }
    
}

extension RSS.Category: Equatable {
    
    public static func ==(lhs: RSS.Category, rhs: RSS.Category) -> Bool {
        return lhs.name == rhs.name &&
            lhs.domain == rhs.domain
    }
    
}

extension RSS.Category {
    
    static var parameter: Parameter<RSS.Category> {
        return Parameter(apiDescription: "category") {
            let dictParser = DictionaryParser(pure: makeCategory)
                <*> _name
                <*> _domain
            guard let dictionary = $0 as? [String: Any] else {
                throw SwiftFeedReaderError.cannotParse("category - not correct format")
            }
            
            return try dictParser.parse(dictionary)
        }
    }
    
}

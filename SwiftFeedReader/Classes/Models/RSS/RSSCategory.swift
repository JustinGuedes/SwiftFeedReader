//
//  RSSCategory.swift
//  Pods-SwiftFeedReader_Example
//
//  Created by Justin Guedes on 2017/08/22.
//

public extension RSSChannel {
    
    /// Category that the channel belongs to.
    struct Category {
        
        /// Name of category.
        ///
        /// Example: Newspaper
        public let name: String
        
        /// Domain of the category.
        ///
        /// Example: http://www.fool.com/cusips
        public let domain: String?
        
    }
    
}

extension RSSChannel.Category {
    
    static var parameter: Parameter<RSSChannel.Category> {
        return Parameter(apiDescription: "category") { _ in
            throw SwiftFeedReaderError.cannotParse("category - need to implement")
        }
    }
    
}

//
//  RSSCategory.swift
//  Pods-SwiftFeedReader_Example
//
//  Created by Justin Guedes on 2017/08/22.
//

extension RSSChannel {
    
    /// Category that the channel belongs to.
    public struct Category {
        
        /// Name of category.
        ///
        /// Example: Newspaper
        public let name: String
        
        /// Domain of the category.
        ///
        /// Example: http://www.fool.com/cusips
        public let domain: String?
        
        static var parameter: Parameter<Category> {
            return Parameter(apiDescription: "category") { _ in
                throw SwiftFeedReaderError.cannotParse("category - need to implement")
            }
        }
        
    }
    
}

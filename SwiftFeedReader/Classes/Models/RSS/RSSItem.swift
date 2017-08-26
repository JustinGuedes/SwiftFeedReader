//
//  RSSItem.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/22.
//

public extension RSS {
    
    /// Represents an item of the channel.
    struct Item {
        
        /// The title of the item.
        ///
        /// Example: Venice Film Festival Tries to Quit Sinking
        public let title: String?
        fileprivate static let _title = NamedParameter(apiDescription: "The title of the item.",
                                                       key: "title",
                                                       parameter: String.parameter).optional
        
        /// The URL of the item.
        ///
        /// Example: http://www.nytimes.com/2002/09/07/movies/07FEST.html
        public let link: URL?
        fileprivate static let _link = NamedParameter(apiDescription: "The URL of the item.",
                                                     key: "link",
                                                     parameter: URL.parameter).optional
        
        /// The item synopsis.
        ///
        /// Example: Some of the most heated chatter at the Venice Film Festival this week...
        public let description: String?
        fileprivate static let _description = NamedParameter(apiDescription: "The item synopsis.",
                                                             key: "description",
                                                             parameter: String.parameter).optional
        
        /// Email address of the author of the item.
        ///
        /// Example: oprah@oxygen.net
        public let author: String?
        fileprivate static let _author = NamedParameter(apiDescription: "Email address of the author of the item.",
                                                        key: "author",
                                                        parameter: String.parameter).optional
        
        /// Includes the item in one or more categories.
        ///
        /// Example: Simpsons Characters
        public let category: [Category]?
        fileprivate static let _category = NamedParameter(apiDescription: "Includes the item in one or more categories.",
                                                          key: "category",
                                                          parameter: Array.parameterOf(Category.parameter)).optional
        
        /// URL of a page for comments relating to the item.
        ///
        /// Example: http://www.myblog.org/cgi-local/mt/mt-comments.cgi?entry_id=290
        public let comments: URL?
        fileprivate static let _comments = NamedParameter(apiDescription: "URL of a page for comments relating to the item.",
                                                          key: "comments",
                                                          parameter: URL.parameter).optional
        
        /// Describes a media object that is attached to the item.
        ///
        /// Example: <enclosure url="http://live.curry.com/mp3/celebritySCms.mp3" length="1069871" type="audio/mpeg"/>
        public let enclosure: Enclosure?
        fileprivate static let _enclosure = NamedParameter(apiDescription: "Describes a media object that is attached to the item.",
                                                           key: "enclosure",
                                                           parameter: Enclosure.parameter).optional
        
        /// A string that uniquely identifies the item.
        ///
        /// Example: <guid isPermaLink="true">http://inessential.com/2002/09/01.php#a2</guid>
        public let guid: GUID?
        fileprivate static let _guid = NamedParameter(apiDescription: "A string that uniquely identifies the item.",
                                                      key: "guid",
                                                      parameter: GUID.parameter).optional
        
        /// Indicates when the item was published.
        ///
        /// Example: Sun, 19 May 2002 15:21:36 GMT
        public let publicationDate: Date?
        fileprivate static let _publicationDate = NamedParameter(apiDescription: "Indicates when the item was published.",
                                                                 key: "pubDate",
                                                                 parameter: Date.parameter).optional
        
        /// The RSS channel that the item came from.
        ///
        /// Example: <source url="http://www.quotationspage.com/data/qotd.rss">Quotes of the Day</source>
        public let source: Source?
        fileprivate static let _source = NamedParameter(apiDescription: "The RSS channel that the item came from.",
                                                        key: "source",
                                                        parameter: Source.parameter).optional
        
        fileprivate static let makeItem = curry(Item.init)
        
    }
    
}

extension RSS.Item: Equatable {
    
    public static func ==(lhs: RSS.Item, rhs: RSS.Item) -> Bool {
        return lhs.title == rhs.title &&
            lhs.link == rhs.link &&
            lhs.description == rhs.description &&
            lhs.author == rhs.author &&
            (lhs.category ?? []) == (rhs.category ?? []) &&
            lhs.comments == rhs.comments &&
            lhs.enclosure == rhs.enclosure &&
            lhs.guid == rhs.guid &&
            lhs.publicationDate == rhs.publicationDate &&
            lhs.source == rhs.source
    }
    
}

extension RSS.Item {
    
    static var parameter: Parameter<RSS.Item> {
        return Parameter(apiDescription: "item") {
            let dictParser = DictionaryParser(pure: makeItem)
                <*> _title
                <*> _link
                <*> _description
                <*> _author
                <*> _category
                <*> _comments
                <*> _enclosure
                <*> _guid
                <*> _publicationDate
                <*> _source
            guard let dictionary = $0 as? [String: Any] else {
                throw SwiftFeedReaderError.cannotParse("item - not correct format")
            }
            
            return try dictParser.parse(dictionary)
        }
    }
    
}

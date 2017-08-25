//
//  RSSChannel.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/21.
//


/// Structure of RSS Channel as defined by https://validator.w3.org/feed/docs/rss2.html
public struct RSSChannel {
    
    /// Required Parameters
    
    /// The name of the channel. It's how people refer to your service. If
    /// you have an HTML website that contains the same information as your RSS file,
    /// the title of your channel should be the same as the title of your website.
    ///
    /// Example: GoUpstate.com News Headlines
    public let title: String
    fileprivate static let _title = NamedParameter(apiDescription: "The name of the channel.",
                                                   key: "title",
                                                   parameter: String.parameter)
    
    /// The URL to the HTML website corresponding to the channel.
    ///
    /// Example: http://www.goupstate.com/
    public let link: URL
    fileprivate static let _link = NamedParameter(apiDescription: "The URL to the HTML website corresponding to the channel.",
                                                  key: "link",
                                                  parameter: URL.parameter)
    
    /// Phrase or sentence describing the channel.
    ///
    /// Example: The latest news from GoUpstate.com, a Spartanburg Herald-Journal
    /// Web site.
    public let description: String
    fileprivate static let _description = NamedParameter(apiDescription: "Phrase or sentence describing the channel.",
                                                         key: "description",
                                                         parameter: String.parameter)
    
    /// Optional Parameters
    
    /// The language the channel is written in. This allows aggregators to group
    /// all Italian language sites, for example, on a single page.
    ///
    /// Example: en-us
    public let language: Language?
    fileprivate static let _language = NamedParameter(apiDescription: "The language the channel is written in.",
                                                      key: "language",
                                                      parameter: Language.parameter).optional
    
    /// Copyright notice for content in the channel.
    ///
    /// Example: Copyright 2002, Spartanburg Herald-Journal
    public let copyright: String?
    fileprivate static let _copyright = NamedParameter(apiDescription: "Copyright notice for content in the channel.",
                                                       key: "copyright",
                                                       parameter: String.parameter).optional
    
    /// Email address for person responsible for editorial content.
    ///
    /// Example: geo@herald.com (George Matesky)
    public let managingEditor: String?
    fileprivate static let _managingEditor = NamedParameter(apiDescription: "Email address for person responsible for editorial content.",
                                                            key: "managingEditor",
                                                            parameter: String.parameter).optional
    
    /// Email address for person responsible for technical issues relating to channel.
    ///
    /// Example: betty@herald.com (Betty Guernsey)
    public let webMaster: String?
    fileprivate static let _webMaster = NamedParameter(apiDescription: "Email address for person responsible for technical issues relating to channel.",
                                                       key: "webMaster",
                                                       parameter: String.parameter).optional
    
    /// The publication date for the content in the channel.
    ///
    /// Example: Sat, 07 Sep 2002 0:00:01 GMT
    public let publicationDate: Date?
    fileprivate static let _publicationDate = NamedParameter(apiDescription: "The publication date for the content in the channel.",
                                                             key: "pubDate",
                                                             parameter: Date.parameter).optional
    
    /// The last time the content of the channel changed.
    ///
    /// Example: Sat, 07 Sep 2002 9:42:31 GMT
    public let lastBuildDate: Date?
    fileprivate static let _lastBuildDate = NamedParameter(apiDescription: "The last time the content of the channel changed.",
                                                           key: "lastBuildDate",
                                                           parameter: Date.parameter).optional
    
    /// Specify one or more categories that the channel belongs to.
    ///
    /// Example: <category>Newspapers</category>
    public let categories: [Category]?
    fileprivate static let _categories = NamedParameter(apiDescription: "Specify one or more categories that the channel belongs to.",
                                                        key: "category",
                                                        parameter: Array.parameterOf(Category.parameter)).optional
    
    /// A string indicating the program used to generate the channel.
    ///
    /// Example: MightyInHouse Content System v2.3
    public let generator: String?
    fileprivate static let _generator = NamedParameter(apiDescription: "A string indicating the program used to generate the channel.",
                                                       key: "generator",
                                                       parameter: String.parameter).optional
    
    /// A URL that points to the documentation for the format used in the RSS
    /// file.
    ///
    /// Example: http://backend.userland.com/rss
    public let docs: URL?
    fileprivate static let _docs = NamedParameter(apiDescription: "A URL that points to the documentation for the format used in the RSS file",
                                                  key: "docs",
                                                  parameter: URL.parameter).optional
    
    /// Allows processes to register with a cloud to be notified of updates to the
    /// channel, implementing a lightweight publish-subscribe protocol for RSS feeds.
    ///
    /// Example: <cloud domain="rpc.sys.com" port="80" path="/RPC2" registerProcedure="pingMe" protocol="soap"/>
    public let cloud: Cloud?
    fileprivate static let _cloud = NamedParameter(apiDescription: "Allows processes to register with a cloud to be notified of updates to the channel, implementing a lightweight publish-subscribe protocol for RSS feeds.",
                                                   key: "cloud",
                                                   parameter: Cloud.parameter).optional
    
    /// ttl stands for time to live. It's a number of minutes that indicates how long
    /// a channel can be cached before refreshing from the source.
    ///
    /// Example: <ttl>60</ttl>
    public let timeToLive: Int?
    fileprivate static let _timeToLive = NamedParameter(apiDescription: "It's a number of minutes that indicates how long a channel can be cached before refreshing from the source.",
                                                        key: "ttl",
                                                        parameter: Int.parameter).optional
    
    /// Specifies a GIF, JPEG or PNG image that can be displayed with the channel.
    public let image: Image?
    fileprivate static let _image = NamedParameter(apiDescription: "Specifies a GIF, JPEG or PNG image that can be displayed with the channel.",
                                                   key: "image",
                                                   parameter: Image.parameter).optional
    
    /// Specifies a text input box that can be displayed with the channel.
    public let textInput: TextInput?
    fileprivate static let _textInput = NamedParameter(apiDescription: "Specifies a text input box that can be displayed with the channel.",
                                                       key: "textInput",
                                                       parameter: TextInput.parameter).optional
    
    /// A hint for aggregators telling them which hours they can skip.
    public let skipHours: [Int]?
    fileprivate static let _skipHours = NamedParameter(apiDescription: "A hint for aggregators telling them which hours they can skip.",
                                                       key: "skipHours",
                                                       parameter: Array.parameterOf(Int.parameter)).optional
    
    /// A hint for aggregators telling them which days they can skip.
    public let skipDays: [Int]?
    fileprivate static let _skipDays = NamedParameter(apiDescription: "A hint for aggregators telling them which days they can skip.",
                                                      key: "skipDays",
                                                      parameter: Array.parameterOf(Int.parameter)).optional
    
    /// An item may represent a "story" -- much like a story in a newspaper or
    /// magazine; if so its description is a synopsis of the story, and the link
    /// points to the full story.
    public let items: [Item]?
    fileprivate static let _items = NamedParameter(apiDescription: "An item may represent a \"story\"",
                                                   key: "item",
                                                   parameter: Array.parameterOf(Item.parameter)).optional
    
    /// Curried version of the intialiser.
    fileprivate static let makeRSSChannel = curry(RSSChannel.init)
    
}

extension RSSChannel: Equatable {
    
    public static func ==(lhs: RSSChannel, rhs: RSSChannel) -> Bool {
        return lhs.title == rhs.title &&
        lhs.link == rhs.link &&
        lhs.description == rhs.description &&
        lhs.language == rhs.language &&
        lhs.copyright == rhs.copyright &&
        lhs.managingEditor == rhs.managingEditor &&
        lhs.webMaster == rhs.webMaster &&
        lhs.publicationDate == rhs.publicationDate &&
        lhs.lastBuildDate == rhs.lastBuildDate &&
        (lhs.categories ?? []) == (rhs.categories ?? []) &&
        lhs.generator == rhs.generator &&
        lhs.docs == rhs.docs &&
        lhs.cloud == rhs.cloud &&
        lhs.timeToLive == rhs.timeToLive &&
        lhs.image == rhs.image &&
        lhs.textInput == rhs.textInput &&
        (lhs.skipHours ?? []) == (rhs.skipHours ?? []) &&
        (lhs.skipDays ?? []) == (rhs.skipDays ?? []) &&
        (lhs.items ?? []) == (rhs.items ?? [])
    }
    
}

extension RSSChannel {
    
    static var parameter: Parameter<RSSChannel> {
        return Parameter(apiDescription: "channel") {
            let dictParser = DictionaryParser(pure: makeRSSChannel)
                <*> _title
                <*> _link
                <*> _description
                <*> _language
                <*> _copyright
                <*> _managingEditor
                <*> _webMaster
                <*> _publicationDate
                <*> _lastBuildDate
                <*> _categories
                <*> _generator
                <*> _docs
                <*> _cloud
                <*> _timeToLive
                <*> _image
                <*> _textInput
                <*> _skipHours
                <*> _skipDays
                <*> _items
            guard let dictionary = $0 as? [String: Any] else {
                throw SwiftFeedReaderError.cannotParse("channel - not correct format")
            }
            
            return try dictParser.parse(dictionary)
        }
    }
    
    static var schema: XmlSchema = ["category": .object,
                                    "cloud": .object,
                                    "enclosure": .object,
                                    "guid": .object,
                                    "height": .int,
                                    "image": .object,
                                    "isPermaLink": .bool,
                                    "item": .object,
                                    "length": .int,
                                    "port": .int,
                                    "skipDays": .int,
                                    "skipHours": .int,
                                    "source": .object,
                                    "textInput": .object,
                                    "ttl": .int,
                                    "width": .int]
    
}

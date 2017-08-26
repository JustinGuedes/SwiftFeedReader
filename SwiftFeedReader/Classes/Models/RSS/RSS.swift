//
//  RSS.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/26.
//

public struct RSS {
    
    /// Version of the RSS Feed.
    public let version: String
    fileprivate static let _version = NamedParameter(apiDescription: "Version of the RSS Feed.",
                                                     key: "version",
                                                     parameter: String.parameter)
    
    /// Channel of the RSS Feed.
    public let channel: Channel
    fileprivate static let _channel = NamedParameter(apiDescription: "Channel of the RSS Feed.",
                                                     key: "channel",
                                                     parameter: Channel.parameter)
    
    /// Curried version of the intialiser.
    fileprivate static let makeRSS = curry(RSS.init)
    
}

extension RSS: Equatable {
    
    public static func ==(lhs: RSS, rhs: RSS) -> Bool {
        return lhs.version == rhs.version &&
            lhs.channel == rhs.channel
    }
    
}

extension RSS {
    
    static var parameter: Parameter<RSS> {
        return Parameter(apiDescription: "rss") {
            let dictParser = DictionaryParser(pure: makeRSS)
                <*> _version
                <*> _channel
            guard let dictionary = $0 as? [String: Any] else {
                throw SwiftFeedReaderError.cannotParse("rss - not correct format")
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

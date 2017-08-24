//
//  RSSTextInput.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/22.
//

public extension RSSChannel {
    
    /// Represents a text input box for the channel.
    struct TextInput {
        
        /// The label of the submit button in the text input
        /// area.
        public let title: String
        fileprivate static let _title = NamedParameter(apiDescription: "The label of the submit button in the text input area.",
                                                       key: "title",
                                                       parameter: String.parameter)
        
        /// Explains the text input area.
        public let description: String
        fileprivate static let _description = NamedParameter(apiDescription: "Explains the text input area.",
                                                             key: "description",
                                                             parameter: String.parameter)
        
        /// The name of the text object in the text input area.
        public let name: String
        fileprivate static let _name = NamedParameter(apiDescription: "The name of the text object in the text input area.",
                                                      key: "name",
                                                      parameter: String.parameter)
        
        /// The URL of the CGI script that processes the text
        /// input requests.
        public let link: URL
        fileprivate static let _link = NamedParameter(apiDescription: "The URL of the CGI script that processes the text input requests.",
                                                      key: "link",
                                                      parameter: URL.parameter)
        
        /// Curried version of the initialiser.
        fileprivate static let makeTextInput = curry(TextInput.init)
        
    }
    
}

extension RSSChannel.TextInput: Equatable {
    
    public static func ==(lhs: RSSChannel.TextInput, rhs: RSSChannel.TextInput) -> Bool {
        return lhs.title == rhs.title &&
            lhs.description == rhs.description &&
            lhs.name == rhs.name &&
            lhs.link == rhs.link
    }
    
}

extension RSSChannel.TextInput {
    
    static var parameter: Parameter<RSSChannel.TextInput> {
        return Parameter(apiDescription: "text input") {
            let dictParser = DictionaryParser(pure: makeTextInput)
                <*> _title
                <*> _description
                <*> _name
                <*> _link
            guard let dictionary = $0 as? [String: Any] else {
                throw SwiftFeedReaderError.cannotParse("text input - not correct format")
            }
            
            return try dictParser.parse(dictionary)
        }
    }
    
}

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
        
        /// Explains the text input area.
        public let description: String
        
        /// The name of the text object in the text input area.
        public let name: String
        
        /// The URL of the CGI script that processes the text
        /// input requests.
        public let link: URL
        
    }
    
}

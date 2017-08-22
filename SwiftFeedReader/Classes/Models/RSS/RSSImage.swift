//
//  RSSImage.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/22.
//

public extension RSSChannel {
    
    /// Represents an image of the channel.
    struct Image {
        
        /// The URL of the GIF, JPEG or PNG image that represents the
        /// channel.
        public let url: URL
        
        /// Describes the image, it's used in the ALT attribute.
        public let title: String
        
        /// The URL of the site, when the channel is rendered, the image
        /// is a link to the site.
        public let link: URL
        
        /// Width of the image.
        public let width: Int?
        
        /// Height of the image/
        public let height: Int?
        
    }
    
}

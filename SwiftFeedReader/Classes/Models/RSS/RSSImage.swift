//
//  RSSImage.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/22.
//

public extension RSS {
    
    /// Represents an image of the channel.
    struct Image {
        
        /// The URL of the GIF, JPEG or PNG image that represents the
        /// channel.
        public let url: URL
        fileprivate static let _url = NamedParameter(apiDescription: "The URL of the GIF, JPEG or PNG image that represents the channel.",
                                                     key: "url",
                                                     parameter: URL.parameter)
        
        /// Describes the image, it's used in the ALT attribute.
        public let title: String
        fileprivate static let _title = NamedParameter(apiDescription: "Describes the image, it's used in the ALT attribute.",
                                                       key: "title",
                                                       parameter: String.parameter)
        
        /// The URL of the site, when the channel is rendered, the image
        /// is a link to the site.
        public let link: URL
        fileprivate static let _link = NamedParameter(apiDescription: "The URL of the site, when the channel is rendered, the image is a link to the site.",
                                                      key: "link",
                                                      parameter: URL.parameter)
        
        /// Width of the image.
        public let width: Int?
        fileprivate static let _width = NamedParameter(apiDescription: "Width of the image.",
                                                       key: "width",
                                                       parameter: Int.parameter).optional
        
        /// Height of the image.
        public let height: Int?
        fileprivate static let _height = NamedParameter(apiDescription: "Height of the image.",
                                                        key: "height",
                                                        parameter: Int.parameter).optional
        
        /// Curried version of the initialiser.
        fileprivate static let makeImage = curry(Image.init)
        
    }
    
}

extension RSS.Image: Equatable {
    
    public static func ==(lhs: RSS.Image, rhs: RSS.Image) -> Bool {
        return lhs.url == rhs.url &&
            lhs.title == rhs.title &&
            lhs.link == rhs.link &&
            lhs.width == rhs.width &&
            lhs.height == rhs.height
    }
    
}

extension RSS.Image {
    
    static var parameter: Parameter<RSS.Image> {
        return Parameter(apiDescription: "image") {
            let dictParser = DictionaryParser(pure: makeImage)
                <*> _url
                <*> _title
                <*> _link
                <*> _width
                <*> _height
            guard let dictionary = $0 as? [String: Any] else {
                throw SwiftFeedReaderError.cannotParse("image - not correct format")
            }
            
            return try dictParser.parse(dictionary)
        }
    }
    
}

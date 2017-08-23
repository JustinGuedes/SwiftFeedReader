//
//  RSSItem.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/22.
//

public extension RSSChannel {
    
    struct Item {
        
    }
    
}

extension RSSChannel.Item {
    
    static var parameter: Parameter<RSSChannel.Item> {
        return Parameter(apiDescription: "item") { _ in
            throw SwiftFeedReaderError.cannotParse("item - need to implement")
        }
    }
    
}

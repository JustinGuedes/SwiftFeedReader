//
//  RSSCloud.swift
//  Pods-SwiftFeedReader_Example
//
//  Created by Justin Guedes on 2017/08/22.
//

public extension RSSChannel {
    
    /// Represents the web service provided by the channel.
    struct Cloud {
        
        /// Example: radio.xmlstoragesystem.com
        public let domain: String
        
        /// Example: 80
        public let port: Int
        
        /// Example: /RPC2
        public let path: String
        
        /// Example: xmlStorageSystem.rssPleaseNotify
        public let registerProcedure: String
        
        /// Example: xml-rpc
        public let `protocol`: String
        
    }
    
}

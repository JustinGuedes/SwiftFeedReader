//
//  RSSCloud.swift
//  Pods-SwiftFeedReader_Example
//
//  Created by Justin Guedes on 2017/08/22.
//

public extension RSSChannel {
    
    /// Represents the web service provided by the channel.
    struct Cloud {
        
        /// Domain of the web service.
        ///
        /// Example: radio.xmlstoragesystem.com
        public let domain: String
        static let _domain = NamedParameter(apiDescription: "Domain of the web service.",
                                            key: "domain",
                                            parameter: String.parameter)
        
        /// Port of the web service.
        ///
        /// Example: 80
        public let port: Int
        static let _port = NamedParameter(apiDescription: "Port of the web service.",
                                          key: "port",
                                          parameter: Int.parameter)
        
        /// Path for the webservice.
        ///
        /// Example: /RPC2
        public let path: String
        static let _path = NamedParameter(apiDescription: "Path for the webservice.",
                                          key: "path",
                                          parameter: String.parameter)
        
        /// The procedure to call.
        ///
        /// Example: xmlStorageSystem.rssPleaseNotify
        public let registerProcedure: String
        static let _registerProcedure = NamedParameter(apiDescription: "The procedure to call.",
                                                       key: "registerProcedure",
                                                       parameter: String.parameter)
        
        /// The protocol used for web service.
        ///
        /// Example: xml-rpc
        public let `protocol`: String
        static let _protocol = NamedParameter(apiDescription: "The protocol used for web service.",
                                              key: "protocol",
                                              parameter: String.parameter)
        
        /// Curried version of the initialiser.
        static let makeCloud = curry(Cloud.init)
        
    }
    
}

extension RSSChannel.Cloud: Equatable {
    
    public static func ==(lhs: RSSChannel.Cloud, rhs: RSSChannel.Cloud) -> Bool {
        return lhs.domain == rhs.domain &&
            lhs.port == rhs.port &&
            lhs.path == rhs.path &&
            lhs.registerProcedure == rhs.registerProcedure &&
            lhs.protocol == rhs.protocol
    }
    
}

extension RSSChannel.Cloud {
    
    static var parameter: Parameter<RSSChannel.Cloud> {
        return Parameter(apiDescription: "cloud") {
            let dictParser = DictionaryParser(pure: makeCloud) <*> _domain <*> _port <*> _path <*> _registerProcedure <*> _protocol
            guard let dictionary = $0 as? [String: Any] else {
                throw SwiftFeedReaderError.cannotParse("cloud - not correct format")
            }
            
            return try dictParser.parse(dictionary)
        }
    }
    
}
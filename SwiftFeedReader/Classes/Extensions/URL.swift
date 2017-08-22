//
//  URL.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/22.
//

extension URL {
    
    static var parameter: Parameter<URL> {
        return Parameter(apiDescription: "url") {
            guard let string = $0 as? String,
                let url = URL(string: string) else {
                throw SwiftFeedReaderError.cannotParse("url")
            }
            
            return url
        }
    }
    
}

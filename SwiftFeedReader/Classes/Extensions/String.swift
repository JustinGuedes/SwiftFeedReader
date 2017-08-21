//
//  String.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/21.
//

extension String {
    
    static var parameter: Parameter<String> {
        return Parameter(apiDescription: "string") {
            guard let string = $0 as? String else {
                throw SwiftFeedReaderError.cannotParse("string")
            }
            
            return string
        }
    }
    
}

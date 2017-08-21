//
//  Int.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/21.
//

extension Int {
    
    static var parameter: Parameter<Int> {
        return Parameter(apiDescription: "integer") {
            guard let integer = $0 as? Int else {
                throw SwiftFeedReaderError.cannotParse("integer")
            }
            
            return integer
        }
    }
    
}

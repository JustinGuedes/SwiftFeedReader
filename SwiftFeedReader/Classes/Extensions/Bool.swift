//
//  Bool.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/24.
//

extension Bool {
    
    static var parameter: Parameter<Bool> {
        return Parameter(apiDescription: "boolean") {
            guard let boolean = $0 as? Bool else {
                throw SwiftFeedReaderError.cannotParse("boolean")
            }
            
            return boolean
        }
    }
    
}

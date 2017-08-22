//
//  Date.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/22.
//

extension Date {
    
    static var parameter: Parameter<Date> {
        return Parameter(apiDescription: "date") { _ in
            throw SwiftFeedReaderError.cannotParse("date - need to implement")
        }
    }
    
}

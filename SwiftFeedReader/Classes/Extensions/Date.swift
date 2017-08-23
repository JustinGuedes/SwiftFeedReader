//
//  Date.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/22.
//

extension Date {
    
    static var parameter: Parameter<Date> {
        return Parameter(apiDescription: "date") {
            let rfc822DateFormats = [
                "EEE, dd MMM yyyy HH:mm:ss zzzz",
                "EEE, d MMM yyyy HH:mm zzzz",
                "d MMM yyyy HH:mm:ss Z"
            ]
            
            guard let dateString = $0 as? String else {
                throw SwiftFeedReaderError.cannotParse("date - invalid type")
            }
            
            let dateFormatter = DateFormatter()
            for dateFormat in rfc822DateFormats {
                dateFormatter.dateFormat = dateFormat
                if let formattedDate = dateFormatter.date(from: dateString) {
                    return formattedDate
                }
            }
            
            throw SwiftFeedReaderError.cannotParse("date - invalid format [\(dateString)]")
        }
    }
    
}

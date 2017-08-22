//
//  Array.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/22.
//

extension Array {
    
    static var parameterOf: (Parameter<Element>) -> Parameter<Array<Element>> {
        return { parameter in
            return Parameter(apiDescription: "array of \(parameter.apiDescription)") {
                guard let arrayOfAny = $0 as? [Any] else {
                        throw SwiftFeedReaderError.cannotParse("array of \(parameter.apiDescription)")
                }
                
                let arrayOfParameters = try arrayOfAny.map(parameter.parse)
                return arrayOfParameters
            }
        }
    }
    
}

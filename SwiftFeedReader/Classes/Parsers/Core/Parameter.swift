//
//  Parameter.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/21.
//

/// Primitive parameter.
struct Parameter<T> {
    
    /// Description of parameter.
    let apiDescription: String
    
    /// Trys to convert the parameter passed to the type,
    /// else throws an exception.
    let parse: (Any) throws -> T
    
}

extension Parameter: CustomStringConvertible {
    
    var description: String {
        return apiDescription
    }
    
}

extension Parameter {
    
    /// Creates parameter with condition.
    ///
    /// - Parameters:
    ///   - apiDescription: Description for the conditional parameter.
    ///   - condition: Condition for the parameter.
    /// - Returns: New parameter with condition check.
    func check(apiDescription: String, condition: @escaping (T) -> Bool) -> Parameter<T> {
        return Parameter(apiDescription: "\(self.apiDescription), \(apiDescription)") { value in
            let result = try self.parse(value)
            guard condition(result) else {
                throw SwiftFeedReaderError.conditionNotMet(apiDescription)
            }
            
            return result
        }
    }
    
}

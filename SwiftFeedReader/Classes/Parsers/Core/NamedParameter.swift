//
//  NamedParameter.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/21.
//

/// Parameter linked to a key value.
struct NamedParameter<T> {
    
    /// Description of the parameter.
    let apiDescription: String
    
    /// The key that the parameter can be linked to.
    let key: String
    
    /// Trys to convert the parameter passed to the type,
    /// else throws an exception.
    let parse: ([String: Any]) throws -> T
    
}

extension NamedParameter {
    
    /// Creates named parameter from a parameter.
    ///
    /// - Parameters:
    ///   - apiDescription: Description of the parameter.
    ///   - key: The key that the parameter can be linked to.
    ///   - parameter: Parameter to parse.
    init(apiDescription: String, key: String, parameter: Parameter<T>) {
        self.apiDescription = "\(apiDescription) - \(parameter.apiDescription)"
        self.key = key
        self.parse = { dict in
            guard let value = dict[key] else {
                throw SwiftFeedReaderError.parameterNotFound("\(apiDescription) - \(parameter.apiDescription) [key: \(key)]")
            }
            
            do {
                return try parameter.parse(value)
            } catch let SwiftFeedReaderError.conditionNotMet(conditionMessage) {
                throw SwiftFeedReaderError.conditionNotMet("\(apiDescription) - \(parameter.apiDescription) [failed condition: \(conditionMessage)]")
            } catch let SwiftFeedReaderError.cannotParse(parseMessage) {
                throw SwiftFeedReaderError.cannotParse("\(apiDescription) - \(parameter.apiDescription) [cannot parse: \(parseMessage)]")
            }
        }
    }
    
    /// Creates an optional version of the parameter.
    var optional: NamedParameter<T?> {
        return NamedParameter<T?>(apiDescription: "\(self.apiDescription) (optional)", key: self.key) { dict in
            guard let _ = dict[self.key] else {
                return .none
            }
            
            do {
                return try self.parse(dict)
            } catch let SwiftFeedReaderError.conditionNotMet(conditionMessage) {
                throw SwiftFeedReaderError.conditionNotMet("\(self.apiDescription) [failed condition: \(conditionMessage)]")
            } catch let SwiftFeedReaderError.cannotParse(parseMessage) {
                throw SwiftFeedReaderError.cannotParse("\(self.apiDescription) [cannot parse: \(parseMessage)]")
            }
        }
    }

}

//
//  DictionaryParser.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/21.
//

/// Parses dictionaries to the type.
struct DictionaryParser<T> {
    
    /// Descriptions for all the parameters
    let apiDescriptions: [String: String]
    
    /// Parses the dictionary to the type.
    let parse: ([String: Any]) throws -> T
    
}

extension DictionaryParser {
    
    /// Creates dictionary parser from named parameter.
    ///
    /// - Parameter parameter: Named parameter to parse with.
    init(_ parameter: NamedParameter<T>) {
        self.apiDescriptions = [parameter.key: parameter.apiDescription]
        self.parse = parameter.parse
    }
    
    /// Creates dictionary parser that passes the values through.
    ///
    /// - Parameter value: The value to return through parse.
    init(pure value: T) {
        self.apiDescriptions = [:]
        self.parse = { _ in value }
    }
}

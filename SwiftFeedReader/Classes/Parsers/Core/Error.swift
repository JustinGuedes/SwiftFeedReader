//
//  Error.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/21.
//

/// Errors thrown in SwiftFeedReader.
///
/// - cannotParse: When parameter cannot be parsed.
/// - conditionNotMet: When condition for parameter cannot be met.
/// - parameterNotFound: When required parameter does not exist.
public enum SwiftFeedReaderError: Error {
    case cannotParse(String)
    case conditionNotMet(String)
    case parameterNotFound(String)
}

//
//  Error.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/21.
//

public enum SwiftFeedReaderError: Error {
    case cannotParse(String)
    case conditionNotMet(String)
    case parameterNotFound(String)
}

//
//  XMLSchemeType.swift
//  SwiftFeedReader
//
//  Created by Justin Guedes on 2017/08/25.
//

public typealias XmlSchema = [String: XMLSchemeType]

public enum XMLSchemeType {
    case string
    case int
    case bool
    case object
    
    func cast(value: String, withName name: String) -> Any? {
        switch self {
        case .string:
            return value
        case .int:
            return Int(value)
        case .bool:
            return Bool(value)
        case .object:
            return [name: value]
        }
    }
}

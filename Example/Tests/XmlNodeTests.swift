//
//  XmlNodeTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/24.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class XmlNodeTests: XCTestCase {
    
    func testShouldConvertVeryBasicXmlToJson() {
        let basicXml = XmlNode(name: "root")
        basicXml.updateValue("value")
        
        let result = basicXml.toJson()
        
        let expectedResult = "value"
        XCTAssertEqual(expectedResult, result as? String)
    }
    
    func testShouldConvertXmlWithOneChildToJson() {
        struct XmlWithOneChild {
            
            let example: String
            static let _example = NamedParameter(apiDescription: "example", key: "example", parameter: String.parameter)
            
            static func parse(_ value: Any) -> XmlWithOneChild? {
                let parser = DictionaryParser(pure: XmlWithOneChild.init) <*> _example
                guard let value = value as? [String: Any] else {
                    return .none
                }
                
                return try? parser.parse(value)
            }
            
        }
        
        let rootXml = XmlNode(name: "root")
        let childXml = XmlNode(name: "example")
        childXml.updateValue("value")
        rootXml.appendChild(childXml)
        
        let result = rootXml.toJson()
        
        let xmlWithOneChild = XmlWithOneChild.parse(result)
        XCTAssertNotNil(xmlWithOneChild)
        XCTAssertEqual("value", xmlWithOneChild?.example)
    }
    
    func testShouldConvertXmlWithMoreThanOneChildToJson() {
        struct XmlWithMoreThanOneChild {
            
            let example: String
            static let _example = NamedParameter(apiDescription: "example", key: "example", parameter: String.parameter)
            
            let example2: String
            static let _example2 = NamedParameter(apiDescription: "example2", key: "example2", parameter: String.parameter)
            
            static func parse(_ value: Any) -> XmlWithMoreThanOneChild? {
                let parser = DictionaryParser(pure: curry(XmlWithMoreThanOneChild.init)) <*> _example <*> _example2
                guard let value = value as? [String: Any] else {
                    return .none
                }
                
                return try? parser.parse(value)
            }
            
        }
        
        let rootXml = XmlNode(name: "root")
        let childXml = XmlNode(name: "example")
        childXml.updateValue("value")
        let childXml2 = XmlNode(name: "example2")
        childXml2.updateValue("value2")
        rootXml.appendChild(childXml)
        rootXml.appendChild(childXml2)
        
        let result = rootXml.toJson()
        
        let xmlWithMoreThanOneChild = XmlWithMoreThanOneChild.parse(result)
        XCTAssertNotNil(xmlWithMoreThanOneChild)
        XCTAssertEqual("value", xmlWithMoreThanOneChild?.example)
        XCTAssertEqual("value2", xmlWithMoreThanOneChild?.example2)
    }
    
    func testShouldConvertXmlWithAttributesToJson() {
        struct XmlWithAttributes {
            
            let root: String
            static let _root = NamedParameter(apiDescription: "root", key: "root", parameter: String.parameter)
            
            let example: String
            static let _example = NamedParameter(apiDescription: "example", key: "example", parameter: String.parameter)
            
            let example2: String
            static let _example2 = NamedParameter(apiDescription: "example2", key: "example2", parameter: String.parameter)
            
            static func parse(_ value: Any) -> XmlWithAttributes? {
                let parser = DictionaryParser(pure: curry(XmlWithAttributes.init)) <*> _root <*> _example <*> _example2
                guard let value = value as? [String: Any] else {
                    return .none
                }
                
                return try? parser.parse(value)
            }
            
        }
        
        let rootXml = XmlNode(name: "root",
                              attributes: ["example": "value",
                                           "example2": "value2"])
        rootXml.updateValue("rootValue")
        
        let result = rootXml.toJson()
        
        let xmlWithAttributes = XmlWithAttributes.parse(result)
        XCTAssertNotNil(xmlWithAttributes)
        XCTAssertEqual("rootValue", xmlWithAttributes?.root)
        XCTAssertEqual("value", xmlWithAttributes?.example)
        XCTAssertEqual("value2", xmlWithAttributes?.example2)
    }
    
    
    
    func testShouldConvertXmlWithChildWithAttributesToJson() {
        struct XmlWithChildWithAttributes {
            
            struct Example {
                
                let attr: String
                static let _attr = NamedParameter(apiDescription: "attr", key: "attr", parameter: String.parameter)
                
                static var parameter: Parameter<Example> {
                    return Parameter(apiDescription: "example") { value in
                        let parser = DictionaryParser(pure: Example.init) <*> _attr
                        guard let value = value as? [String: Any] else {
                            throw SwiftFeedReaderError.cannotParse("example")
                        }
                        
                        return try parser.parse(value)
                    }
                }
                
            }
            
            let example: Example
            static let _example = NamedParameter(apiDescription: "example", key: "example", parameter: Example.parameter)
            
            let example2: String
            static let _example2 = NamedParameter(apiDescription: "example2", key: "example2", parameter: String.parameter)
            
            static func parse(_ value: Any) -> XmlWithChildWithAttributes? {
                let parser = DictionaryParser(pure: curry(XmlWithChildWithAttributes.init)) <*> _example <*> _example2
                guard let value = value as? [String: Any] else {
                    return .none
                }
                
                return try? parser.parse(value)
            }
            
        }
        
        let rootXml = XmlNode(name: "root")
        let childXml = XmlNode(name: "example",
                               attributes: ["attr": "ibute"])
        let childXml2 = XmlNode(name: "example2")
        childXml2.updateValue("value")
        rootXml.appendChild(childXml)
        rootXml.appendChild(childXml2)
        
        let result = rootXml.toJson()
        
        let xmlWithChildWithAttributes = XmlWithChildWithAttributes.parse(result)
        XCTAssertNotNil(xmlWithChildWithAttributes)
        XCTAssertEqual("ibute", xmlWithChildWithAttributes?.example.attr)
        XCTAssertEqual("value", xmlWithChildWithAttributes?.example2)
    }
    
    func testShouldConvertXmlWithInnerChildrenToJson() {
        struct XmlWithInnerChildren {
            
            struct Example {
                
                let attr: String
                static let _attr = NamedParameter(apiDescription: "attr", key: "attr", parameter: String.parameter)
                
                static var parameter: Parameter<Example> {
                    return Parameter(apiDescription: "example") { value in
                        let parser = DictionaryParser(pure: Example.init) <*> _attr
                        guard let value = value as? [String: Any] else {
                            throw SwiftFeedReaderError.cannotParse("example")
                        }
                        
                        return try parser.parse(value)
                    }
                }
                
            }
            
            let example: Example
            static let _example = NamedParameter(apiDescription: "example", key: "example", parameter: Example.parameter)
            
            let example2: String
            static let _example2 = NamedParameter(apiDescription: "example2", key: "example2", parameter: String.parameter)
            
            static func parse(_ value: Any) -> XmlWithInnerChildren? {
                let parser = DictionaryParser(pure: curry(XmlWithInnerChildren.init)) <*> _example <*> _example2
                guard let value = value as? [String: Any] else {
                    return .none
                }
                
                return try? parser.parse(value)
            }
        }
        
        let rootXml = XmlNode(name: "root")
        let childXml = XmlNode(name: "example")
        let innerChildXml = XmlNode(name: "attr")
        innerChildXml.updateValue("ibute")
        childXml.appendChild(innerChildXml)
        let childXml2 = XmlNode(name: "example2")
        childXml2.updateValue("value")
        rootXml.appendChild(childXml)
        rootXml.appendChild(childXml2)
        
        let result = rootXml.toJson()
        
        let xmlWithInnerChildren = XmlWithInnerChildren.parse(result)
        XCTAssertNotNil(xmlWithInnerChildren)
        XCTAssertEqual("ibute", xmlWithInnerChildren?.example.attr)
        XCTAssertEqual("value", xmlWithInnerChildren?.example2)
    }
    
    func testShouldConvertXmlWithSchemaToJson() {
        struct XmlWithSchema {
            
            let example: Int
            static let _example = NamedParameter(apiDescription: "example", key: "example", parameter: Int.parameter)
            
            static func parse(_ value: Any) -> XmlWithSchema? {
                let parser = DictionaryParser(pure: XmlWithSchema.init) <*> _example
                guard let value = value as? [String: Any] else {
                    return .none
                }
                
                return try? parser.parse(value)
            }
            
        }
        
        let rootXml = XmlNode(name: "root")
        let childXml = XmlNode(name: "example")
        childXml.updateValue("100")
        rootXml.appendChild(childXml)
        
        let schema: XmlSchema = ["example": .int]
        let result = rootXml.toJson(schema)
        
        let xmlWithSchema = XmlWithSchema.parse(result)
        XCTAssertNotNil(xmlWithSchema)
        XCTAssertEqual(100, xmlWithSchema?.example)
    }
    
    func testShouldNotConvertXmlWhenSchemaNotProvided() {
        struct XmlWithSchema {
            
            let example: Int
            static let _example = NamedParameter(apiDescription: "example", key: "example", parameter: Int.parameter)
            
            static func parse(_ value: Any) -> XmlWithSchema? {
                let parser = DictionaryParser(pure: XmlWithSchema.init) <*> _example
                guard let value = value as? [String: Any] else {
                    return .none
                }
                
                return try? parser.parse(value)
            }
            
        }
        
        let rootXml = XmlNode(name: "root")
        let childXml = XmlNode(name: "example")
        childXml.updateValue("100")
        rootXml.appendChild(childXml)
        
        let result = rootXml.toJson()
        
        let xmlWithSchema = XmlWithSchema.parse(result)
        XCTAssertNil(xmlWithSchema)
    }
    
}

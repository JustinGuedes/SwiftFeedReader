//
//  XMLParserTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/24.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class XMLParserTests: XCTestCase {
    
    let parser = XMLParser()
    
    func testShouldParseSimpleXml() {
        let basicXml = "<example>Title</example>"
        
        let result = parser.parse(string: basicXml)
        
        XCTAssertEqual("example", result.name)
        XCTAssertEqual("Title", result.value)
        XCTAssertEqual(0, result.attributes.count)
        XCTAssertEqual(0, result.children.count)
    }
    
    func testShouldParseSimpleXmlWithAttributes() {
        let xmlWithAttributes = "<example e=\"Attribute\">Title</example>"
        
        let result = parser.parse(string: xmlWithAttributes)
        
        XCTAssertEqual("example", result.name)
        XCTAssertEqual("Title", result.value)
        XCTAssertEqual(1, result.attributes.count)
        XCTAssertEqual("Attribute", result.attributes["e"])
        XCTAssertEqual(0, result.children.count)
    }
    
    func testShouldParseXmlWithOneLevelOfChildElements() {
        let xmlWithChildElements = "<example><child>Child</child></example>"
        
        let result = parser.parse(string: xmlWithChildElements)
        
        XCTAssertEqual("example", result.name)
        XCTAssertEqual("", result.value)
        XCTAssertEqual(0, result.attributes.count)
        XCTAssertEqual(1, result.children.count)
        XCTAssertEqual("child", result.children[0].name)
        XCTAssertEqual("Child", result.children[0].value)
    }
    
    func testShouldParseXmlWithMultiLevelChildrenElements() {
        let xmlWithMultiLevelElements = "<example><child><baby>Baby1</baby></child><child2><baby>Baby2</baby><mother>Mom</mother></child2></example>"
        
        let result = parser.parse(string: xmlWithMultiLevelElements)
        
        XCTAssertEqual("example", result.name)
        XCTAssertEqual("", result.value)
        XCTAssertEqual(0, result.attributes.count)
        XCTAssertEqual(2, result.children.count)
        XCTAssertEqual("child", result.children[0].name)
        XCTAssertEqual("", result.children[0].value)
        XCTAssertEqual(1, result.children[0].children.count)
        XCTAssertEqual("baby", result.children[0].children[0].name)
        XCTAssertEqual("Baby1", result.children[0].children[0].value)
        XCTAssertEqual("child2", result.children[1].name)
        XCTAssertEqual("", result.children[1].value)
        XCTAssertEqual(2, result.children[1].children.count)
        XCTAssertEqual("baby", result.children[1].children[0].name)
        XCTAssertEqual("Baby2", result.children[1].children[0].value)
        XCTAssertEqual("mother", result.children[1].children[1].name)
        XCTAssertEqual("Mom", result.children[1].children[1].value)
    }
    
}

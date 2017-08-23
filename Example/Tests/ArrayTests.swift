//
//  ArrayTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/23.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class ArrayTests: XCTestCase {
    
    func testShouldParseArrayOfStringParameters() {
        let arrayOfStrings = ["String1", "String2", "String3"]
        
        XCTAssertEqualParameter(arrayOfStrings, forParameter: Array.parameterOf(String.parameter), withValue: arrayOfStrings)
    }
    
    func testShouldParseArrayOfIntParameters() {
        let arrayOfInts = [1, 2, 3]
        
        XCTAssertEqualParameter(arrayOfInts, forParameter: Array.parameterOf(Int.parameter), withValue: arrayOfInts)
    }
    
    func testShouldParseEmptyArrayOfStringParameters() {
        let emptyArray: [String] = []
        
        XCTAssertEqualParameter(emptyArray, forParameter: Array.parameterOf(String.parameter), withValue: emptyArray)
    }
    
    func testShouldThrowCannotParseErrorWhenParsingNonArray() {
        XCTAssertCannotParse(forParameter: Array.parameterOf(String.parameter), withValue: "not array")
    }
    
    func testShouldThrowCannotParseErrorWhenCannotParseAnyElementInArray() {
        XCTAssertCannotParse(forParameter: Array.parameterOf(String.parameter), withValue: ["String1", 2, "String3"])
    }
    
}

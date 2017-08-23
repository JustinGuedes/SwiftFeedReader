//
//  StringTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/23.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class StringTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = String.parameter
    
    func testShouldParseString() {
        XCTAssertEqualParameter("example", withValue: "example")
    }
    
    func testShouldThrowCannotParseErrorWhenParsingInt() {
        XCTAssertCannotParse(1)
    }
    
    func testShouldThrowCannotParseErrorWhenParsingBool() {
        XCTAssertCannotParse(false)
    }
    
}

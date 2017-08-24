//
//  BoolTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/24.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class BoolTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = Bool.parameter
    
    func testShouldParseBool() {
        XCTAssertEqualParameter(true, withValue: true)
    }
    
    func testShouldThrowCannotParseErrorWhenParsingString() {
        XCTAssertCannotParse("false")
    }
    
    func testShouldThrowCannotParseErrorWhenParsingInt() {
        XCTAssertCannotParse(1)
    }
    
}

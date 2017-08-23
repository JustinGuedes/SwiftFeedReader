//
//  IntTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/23.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class IntTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = Int.parameter
    
    func testShouldParseInt() {
        XCTAssertEqualParameter(100, withValue: 100)
    }
    
    func testShouldThrowCannotParseErrorWhenParsingString() {
        XCTAssertCannotParse("100")
    }
    
    func testShouldThrowCannotParseErrorWhenParsingBool() {
        XCTAssertCannotParse(false)
    }
    
}

//
//  URLTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/23.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class URLTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = URL.parameter
    
    func testShouldParseURL() {
        XCTAssertEqualParameter(URL(string: "http://www.google.com")!, withValue: "http://www.google.com")
    }
    
    func testShouldThrowCannotParseWhenParsingInvalidURL() {
        XCTAssertCannotParse("http://www.g🙃🙃gle.c😀m")
    }
    
    func testShouldThrowCannotParseWhenParsingInt() {
        XCTAssertCannotParse(100)
    }
    
    func testShouldThrowCannotParseWhenParsingBool() {
        XCTAssertCannotParse(false)
    }
    
}

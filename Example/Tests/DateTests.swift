//
//  DateTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/23.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class DateTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = Date.parameter
    
    func testShouldParseRFC822DateWithFourCharacterYear() {
        let (expectedDate, value) = getTodaysDate(valueDateFormat: "EEE, dd MMM yyyy HH:mm:ss zzzz")
        XCTAssertEqualParameter(expectedDate!, withValue: value)
    }
    
    func testShouldParseRFC822DateWithTwoCharacterYear() {
        let (expectedDate, value) = getTodaysDate(valueDateFormat: "EEE, dd MMM yy HH:mm:ss zzzz")
        XCTAssertEqualParameter(expectedDate!, withValue: value)
    }
    
    func testShouldThrowCannotParseWhenParsingInvalidDate() {
        let (_, value) = getTodaysDate(valueDateFormat: "E, dd M y H:m:s")
        XCTAssertCannotParse(value)
    }
    
    func testShouldThrowCannotParseWhenParsingInt() {
        XCTAssertCannotParse(100)
    }
    
    func testShouldThrowCannotParseWhenParsingBool() {
        XCTAssertCannotParse(false)
    }
    
    func getTodaysDate(withTodayDateFormat todayDateFormat: String = "EEE, dd MMM yyyy HH:mm:ss zzzz", valueDateFormat: String) -> (expectedDate: Date?, value: String) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = valueDateFormat
        let value = dateFormatter.string(from: date)
        dateFormatter.dateFormat = todayDateFormat
        let expectedDate = dateFormatter.date(from: value)
        return (expectedDate, value)
    }
    
}

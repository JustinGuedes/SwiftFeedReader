//
//  RSSSourceTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/24.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class RSSSourceTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = RSS.Source.parameter
    
    let sourceDictionary: [String: Any] = ["source": "Example Source",
                                           "url": "http://www.google.com"]
    
    func testShouldThrowParameterNotFoundErrorWhenParsingEmptyDictionary() {
        let emptyDict: [String: Any] = [:]
        
        XCTAssertParameterNotFound(inDictionary: emptyDict)
    }
    
    func testShouldThrowParameterNotFoundErrorWhenParsingDictionaryWithoutSource() {
        let key = "source"
        var dictionaryWithoutSource = sourceDictionary
        dictionaryWithoutSource.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutSource)
    }
    
    func testShouldThrowParameterNotFoundErrorWhenParsingDictionaryWithoutUrl() {
        let key = "url"
        var dictionaryWithoutUrl = sourceDictionary
        dictionaryWithoutUrl.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutUrl)
    }
    
    func testShouldParseDictionaryIntoSourceObject() {
        let expectedSource = RSS.Source(name: sourceDictionary["source"] as! String,
                                        url: URL(string: sourceDictionary["url"] as! String)!)
        
        XCTAssertEqualParameter(expectedSource, withValue: sourceDictionary)
    }
    
}

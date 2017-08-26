//
//  RSSEnclosureTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/24.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class RSSEnclosureTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = RSS.Enclosure.parameter
    
    let enclosureDictionary: [String: Any] = ["url": "http://www.google.com",
                                              "length": 123132,
                                              "type": "audio/mpeg"]
    
    func testShouldThrowParameterNotFoundWhenParsingEmptyDictionary() {
        let emptyDict: [String: Any] = [:]
        
        XCTAssertParameterNotFound(inDictionary: emptyDict)
    }
    
    func testShouldThrowParameterNotFoundWhenParsingDictionaryWithoutUrl() {
        let key = "url"
        var dictionaryWithoutUrl = enclosureDictionary
        dictionaryWithoutUrl.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutUrl)
    }
    
    func testShouldThrowParameterNotFoundWhenParsingDictionaryWithoutLength() {
        let key = "length"
        var dictionaryWithoutLength = enclosureDictionary
        dictionaryWithoutLength.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutLength)
    }
    
    func testShouldThrowParameterNotFoundWhenParsingDictionaryWithoutType() {
        let key = "type"
        var dictionaryWithoutType = enclosureDictionary
        dictionaryWithoutType.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutType)
    }
    
    func testShouldParseDictionaryIntoEnclosureObject() {
        let expectedEnclosure = RSS.Enclosure(url: URL(string: enclosureDictionary["url"] as! String)!,
                                              length: enclosureDictionary["length"] as! Int,
                                              type: MimeType(rawValue: enclosureDictionary["type"] as! String)!)
        
        XCTAssertEqualParameter(expectedEnclosure, withValue: enclosureDictionary)
    }
    
}

//
//  RSSTests.swift
//  SwiftFeedReader_Tests
//
//  Created by Justin Guedes on 2017/08/26.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
@testable import SwiftFeedReader

class RSSTests: XCTestCase, XCTestCaseParameter {
    
    let parameter = RSS.parameter
    
    static let channelDictionary: [String: Any] = ["title": "Title",
                                            "link": "http://www.google.com",
                                            "description": "Description"]
    
    let rssDictionary: [String: Any] = ["version": "2.0",
                                        "channel": channelDictionary]
    
    func testShouldThrowParameterNotFoundWhenParsingEmptyDictionary() {
        let emptyDict: [String: Any] = [:]
        
        XCTAssertParameterNotFound(inDictionary: emptyDict)
    }
    
    func testShouldThrowParameterNotFoundWhenParsingDictionaryWithoutVersion() {
        let key = "version"
        var dictionaryWithoutVersion = rssDictionary
        dictionaryWithoutVersion.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutVersion)
    }
    
    func testShouldThrowParameterNotFoundWhenParsingDictionaryWithoutChannel() {
        let key = "channel"
        var dictionaryWithoutChannel = rssDictionary
        dictionaryWithoutChannel.removeValue(forKey: key)
        
        XCTAssertParameterNotFound(inDictionary: dictionaryWithoutChannel)
    }
    
    func testShouldParseDictionaryIntoRSSObject() {
        let expectedRss = RSS(version: rssDictionary["version"] as! String,
                              channel: try! RSS.Channel.parameter.parse(rssDictionary["channel"] as Any))
        
        XCTAssertEqualParameter(expectedRss, withValue: rssDictionary)
    }
    
}
